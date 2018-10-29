---
layout: post
title: Dependency Injection In Azure Functions V2
date: '2018-10-31T08:48:00.000+10:00'
comments: true
author: aakash
categories: [Azure]
tags: [Azure, Azure Functions]
---

With Azure functions v2 supporting .NET Core it has become easier to do dependency injection. It can be done in a similar way that ASP.NET Core does via `Microsoft.Extensions.DependencyInjection`. 

ASP.NET Core encourages the use of dependency injection by the built-in DI container. This feature of ASP.NET core is very handy as many extensions such as logging and configuration via IOptions pattern are registered using during startup in `Startup.cs`. ASP.NET Core registers these services, along with any custom services you need using the built-in DI container via `IServiceCollection`.

Above handful feature of ASP.NET Core can be utilized for dependency injection in Azure Functions V2 as they come with .NET Core. We create a container by creating an instance of `IServiceCollection` and then registering the services we need. 

Let's see this in action with an example. We'll create an Azure function that returns a list of time zones. These time zones are maintained in a JSON file uploaded to Azure blob storage. Even though it is a very simple scenario, my solution consists of three different projects as below:

- **Function app project**. `Azure.Functions.v2.DI.FunctionApp`. This is the project that contains a Http triggered Azure function, that returns list of time zones via Http GET.
- **Helper project**. `Azure.Functions.v2.DI.Helpers`. As name suggests this contains helper class to read from Azure blob storage. Blob file containing JSON array of time zones is stored in a file named `timezones.json` in a container `azfnv2demo`.
- **Services project**. `Azure.Functions.v2.DI.Services`. This project contains `TimeZoneService` class that returns data to function project by reading data from Azure blob via helper project.

Complete source code is available at: [https://github.com/akki-s/azure-functions-v2-dependency-injection](https://github.com/akki-s/azure-functions-v2-dependency-injection)

This means that Function app project has a dependency services project, and services project has a dependency on helper project. At this stage `TimeZoneService.cs` looks like below:

![TimeZoneService.cs]({{ site.baseurl }}/assets/images/posts/2018/azfnv2di/01.PNG)

As you would have noticed in the code above, a new object of `AzureBlobStorageHelper` is created which is then used to get data from blob storage. However, this makes my `TimeZoneService.cs` code difficult to unit test. What I need at this stage is to inject an instance of `IAzureBlobStorageHelper`, when an instance of `TimeZoneService` is created.

First thing I do is make change in `TimeZoneService.cs` in Services project so as to remove the instantiation of `AzureBlobStorageHelper` and have it injected in the constructor. The constructor of `TimeZoneService` can also include other dependencies such as ILogger for logging, HttpClient for REST calls and etc, but those are left out for the sake of this demo.

Next step is to register the services and build the `ServiceProvider`. This is done by creating an instance of `IServiceCollection`, registering the services and then making a call to `BuildServiceProvider` of the ServiceCollection. This returns the ServiceProvider with a service collection that has all the registrations and other configuration such as adding logging. Following is the class that has a static method called `ConfigureServices` that does all this work. This is what ASP.NET Core does out of the box and I'm utilizing same here for Azure functions.

```csharp
    public static IServiceProvider ConfigureServices()
    {
        var services = new ServiceCollection()
                .AddTransient<ITimeZoneService, TimeZoneService>()
                .AddTransient<IAzureBlobStorageHelper, AzureBlobStorageHelper>();

        return services.BuildServiceProvider();
    }
```

Note that the above method registers `TimeZoneService` and `AzureBlobStorageHelper`.

Now all that's left to be done is to call `ConfigureServices` from within the Azure Function, to configure the service collection, and get an instance of TimeZoneService from the ServiceProvider (You may like to call it something else, such as `container` as it is in other DI frameworks such as AutoFac).

```csharp
    [FunctionName("GetTimeZones")]
    public static async Task<IActionResult> Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "timezones")]HttpRequest req)
    {
        var serviceProvider = Bootstrap.ConfigureServices();
        var timeZoneService = serviceProvider.GetService<ITimeZoneService>();
        var timeZones = await timeZoneService.GetTimeZones().ConfigureAwait(false);

        return new OkObjectResult(timeZones ?? new List<string>());
    }
```

In order to use the generic method `GetService<T>` above we need to add a reference to `Microsoft.Extensions.DependencyInjection` in our functions project:

```xml
 <ItemGroup>
    <PackageReference Include="Microsoft.NET.Sdk.Functions" Version="1.0.13" />
    <PackageReference Include="Microsoft.Extensions.DependencyInjection" Version="2.0.0" />
  </ItemGroup>
```
`TimeZoneService.cs` now injects `IAzureBlobStorageHelper` in its constructor:

```csharp
    public class TimeZoneService : ITimeZoneService
    {
        private const string ContainerName = "azfnv2demo";
        private const string FileName = "timezones.json";

        private readonly IAzureBlobStorageHelper _azureBlobStorageHelper;

        public TimeZoneService(IAzureBlobStorageHelper azureBlobStorageHelper)
        {
            _azureBlobStorageHelper = azureBlobStorageHelper;;
        }

        public async Task<IEnumerable<string>> GetTimeZones()
        {
            var jsonContent = await _azureBlobStorageHelper.DownloadBlobContent(ContainerName, FileName).ConfigureAwait(false);
            return string.IsNullOrEmpty(jsonContent) ? null : JsonConvert.DeserializeObject<IEnumerable<string>>(jsonContent);
        }
    }
```

This is it. This might not be the best solution for DI in Azure functions, but it certainly is very simple. 

**Note:** It is worth noting that, at the time of writing this post, Microsoft is working on integrating DI in Azure functions v2 as can be tracked [here](https://github.com/Azure/Azure-Functions/issues/299). But till then above approach works great.

Complete source code is available at [GitHub](https://github.com/akki-s/azure-functions-v2-dependency-injection)