# 目标文件名
WORKFLOW_NAME=chathub
WORKFLOW_DIR=Workflow
OUTPUT_FILE=$(WORKFLOW_NAME).alfredworkflow

.PHONY: all $(OUTPUT_FILE)

# 默认目标：打包
all: $(OUTPUT_FILE)

# 打包为 .alfredworkflow 文件
$(OUTPUT_FILE):
	zip -r ./$(OUTPUT_FILE) ./assets/ ./src/ icon.png info.plist LICENSE README.md
	@echo "✅ 打包完成：$(OUTPUT_FILE)"

# 清理生成的 .alfredworkflow 文件
clean:
	rm -f $(OUTPUT_FILE)
	@echo "🧹 清理完成"

# 打开 Finder 显示生成的文件
open: $(OUTPUT_FILE)
	open .

# 直接安装（macOS Alfred 支持打开 .alfredworkflow 自动导入）
install: $(OUTPUT_FILE)
	open $(OUTPUT_FILE)
	@echo "🚀 正在安装到 Alfred..."