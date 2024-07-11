read -p "Enter disk to be spun down: " diskNr
echo "-----"
read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
hdparm -S 1 $diskNr
echo "The drive is safe to remove now!"
