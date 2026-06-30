#!/bin/bash

BASE_DIR="$HOME/linux_assignment"
INPUT_FILE="$BASE_DIR/student_list.txt"
TARGET_DIR="$BASE_DIR/student_submissions"
LOG_FILE="$BASE_DIR/logs/folder_creation.log"

if [ ! -f "$INPUT_FILE" ]; then
    echo "Ralat: Fail input '$INPUT_FILE' tidak dijumpai!"
    exit 1
fi

mkdir -p "$TARGET_DIR"
mkdir -p "$BASE_DIR/logs"

total_students=0
declare -A unique_groups

echo "=== Memulakan Proses Penciptaan Folder Student ==="
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Proses bermula." >> "$LOG_FILE"


is_header=true

while read -r line || [ -n "$line" ]; do
    
       if [ "$is_header" = true ]; then
        is_header=false
        continue
    fi

        if [ -z "$(echo "$line" | xargs)" ]; then
        continue
    fi

    
    matric_num=$(echo "$line" | awk '{print $2}')

    class_raw=$(echo "$line" | awk '{for(i=1;i<=NF;i++) if($i ~ /3C/) print $i}')

        if [ -z "$matric_num" ] || [ -z "$class_raw" ]; then
        continue
    fi

       group_name="Group_$class_raw"

        GROUP_FOLDER="$TARGET_DIR/$group_name"
    STUDENT_FOLDER="$GROUP_FOLDER/$matric_num"

       if [ ! -d "$STUDENT_FOLDER" ]; then
        mkdir -p "$STUDENT_FOLDER"

        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Folder Berjaya Dicipta: $group_name/$matric_num" >> "$LOG_FILE"
    fi

        ((total_students++))
    unique_groups["$group_name"]=1

done < "$INPUT_FILE"

echo ""
echo "=============================================="
echo "               PROCESS SUMMARY                "
echo "=============================================="
echo "Total students processed : $total_students" [cite: 82]
echo "Number of groups created : ${#unique_groups[@]}" [cite: 84]
echo "List of all groups created:" [cite: 85]
for group in "${!unique_groups[@]}"; do
    echo "    - $group"
done
echo "=============================================="
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Process Succed" >> "$LOG_FILE"
