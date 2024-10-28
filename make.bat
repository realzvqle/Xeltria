@echo off

if "%1"=="configure" (
    cd kernel
    xmake f --toolchain=aarch64-toolchain
    cd ..
) else if "%1"=="clean" (
    cd kernel 
    rd .xmake /s /q
    rd obj /s /q
    rd build /s /q
    del boot.o /f
    del kernel.elf /f
    cd ..
) else if "%1"=="run" (
    qemu-system-aarch64 -M 6GB -machine virt -cpu cortex-a57 -kernel kernel/kernel.elf -device ramfb  -device virtio-keyboard -display sdl -serial mon:stdio 
) else if "%1"=="build" (
    cd kernel
    xmake build
    cd ..   
) else (
    echo Incorrect Arguments, Arguments are "run, clean, configure, and build"
)