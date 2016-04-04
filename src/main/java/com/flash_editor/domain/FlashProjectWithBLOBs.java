package com.flash_editor.domain;

public class FlashProjectWithBLOBs extends FlashProject {
    private String content;

    private String flashContent;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getFlashContent() {
        return flashContent;
    }

    public void setFlashContent(String flashContent) {
        this.flashContent = flashContent == null ? null : flashContent.trim();
    }
}