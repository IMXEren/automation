
$ndk = Get-ChildItem -Path "$env:ANDROID_HOME/ndk" -Directory | Sort-Object LastWriteTime -Descending | Select-Object -First 1
if (-not $ndk) {
    Write-Error "No NDK directory found in $env:ANDROID_HOME"
    exit 1
}
Write-Host "Using NDK: $($ndk.FullName)"

$targetArchsGo = "arm64", "arm"
$targetArchsCC = "aarch64-linux-android", "armv7a-linux-androideabi"

$index = 0
foreach ($arch in $targetArchsGo) {
    $outputFile = "adbw_port_$arch.bin"
    $archCC = $targetArchsCC[$index]
    $api = "28"
    $env:GOOS = "android"
    $env:GOARCH = $arch
    $env:CC = Join-Path $ndk.FullName "\toolchains\llvm\prebuilt\windows-x86_64\bin\${archCC}${api}-clang.cmd"
    $env:CGO_ENABLED = "1"
    
    go build -ldflags="-extldflags -s" -o $outputFile

    if ($LASTEXITCODE -ne 0) {
        Write-Error "Build failed for $arch using $env:CC"
        exit 1
    }

    Write-Host "Built $outputFile for $arch using $env:CC"
    $index++
}

exit 0
