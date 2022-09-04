package com.example.weblogincore.infrastructure.api.rest.model.form;

import java.util.List;

public class FormResponse {
    private Long id;
    private String name;
    private String description;
    private List<SectionResponse> sectionResponses;
    private Integer totalSections;
    private Integer totalQuestions;

    public FormResponse(Long id, String name, String description, List<SectionResponse> sectionResponses, Integer totalSections, Integer totalQuestions) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.sectionResponses = sectionResponses;
        this.totalSections = totalSections;
        this.totalQuestions = totalQuestions;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<SectionResponse> getSectionResponses() {
        return sectionResponses;
    }

    public void setSectionResponses(List<SectionResponse> sectionResponses) {
        this.sectionResponses = sectionResponses;
    }

    public Integer getTotalSections() {
        return totalSections;
    }

    public void setTotalSections(Integer totalSections) {
        this.totalSections = totalSections;
    }

    public Integer getTotalQuestions() {
        return totalQuestions;
    }

    public void setTotalQuestions(Integer totalQuestions) {
        this.totalQuestions = totalQuestions;
    }
}
