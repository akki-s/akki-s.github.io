$dest = 'tag'

#first remove all files from tag folder

Remove-Item $dest'\*.md' | Where { ! $_.PSIsContainer }

Get-ChildItem "_posts" -Filter *.md | 
Foreach-Object {


    $content = Get-Content $_.FullName | Where-Object { $_.StartsWith("tags:")}

    if($content.Contains('[')){
        $heading,$tags = $content.Replace('[', '').Replace(']', '').split(':')
        $tagsArray = $tags.Trim().split(",")

        foreach($tag in $tagsArray)
        {        
            $tag = $tag.Trim()
            $slug = $tag.ToLower().Replace(" ", "-")

            Write-Host 'generated tag file for' $slug

            $fileName = $($dest + '\' + $slug + '.md')

            
            '---' | Out-File -FilePath $fileName -A -Encoding ascii
            'layout: tagpage' | Out-File -FilePath $fileName -Append -Encoding ascii
            $( "title: " + $tag ) | Out-File -FilePath $fileName -Append -Encoding ascii
            $( "tag: " + $slug ) | Out-File -FilePath $fileName -Append -Encoding ascii
            '---' | Out-File -FilePath $fileName -Append -Encoding ascii

        }
      

    }

    #filter and save content to the original file
    #$content | Where-Object {$_ -match 'step[49]'} | Set-Content $_.FullName

    #filter and save content to a new file 
    #$content | Where-Object {$_ -match 'step[49]'} | Set-Content ($_.BaseName + '_out.log')
    
}
