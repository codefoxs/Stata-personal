import sys
import os
import shutil

# 检查路径是否指向文件
stata_md = "D:\\code\\Hexo\\source\\stata.md"
if os.path.isfile(stata_md):
    # 使用os.remove函数删除文件
    os.remove(stata_md)
# 检查路径是否指向文件夹
elif os.path.isdir(stata_md):
    # 使用os.rmdir函数删除文件夹
    os.rmdir(stata_md)

shutil.copy("D:\\code\\Github\\Stata-personal\\README.md", stata_md)

print("README.md 已转移到博客目录中")

os.system("git add .")
os.system(f'git commit -am "{sys.argv[1]}"')
os.system("git push origin main")
