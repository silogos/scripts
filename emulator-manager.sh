echo "List AVD:"
emulator -list-avds | cat -n
read -p "Select AVD: " index
avd=$(emulator -list-avds | sed "${index}q;d")
echo "Selected $avd"
read -p "Size Ram [1024]: " ram
ram=${ram:-1024}
emulator -netdelay none -netspeed full -no-boot-anim -noaudio -avd $avd -memory $ram  &disown &exit
popd