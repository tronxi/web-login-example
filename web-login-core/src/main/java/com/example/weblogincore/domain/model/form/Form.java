package com.example.weblogincore.domain.model.form;

import java.util.List;

public class Form {
    private final Long id;
    private final String name;
    private final String description;
    private final List<Section> sections;

    public Form(Long id, String name, String description, List<Section> sections) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.sections = sections;
    }

    public Integer totalQuestions() {
        return sections.stream()
                .map(Section::totalQuestions)
                .reduce(Integer::sum)
                .orElse(0);
    }

    public Integer totalSections() {
        return sections.size();
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public List<Section> getSections() {
        return sections;
    }
}
