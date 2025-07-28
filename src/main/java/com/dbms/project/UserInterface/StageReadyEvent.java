package com.dbms.project.UserInterface;

import org.springframework.context.ApplicationEvent;

import javafx.stage.Stage;

public class StageReadyEvent extends ApplicationEvent{
    public Stage stage;

    public StageReadyEvent(Stage stage){
        super(stage);
        this.stage=stage;

    }
    
}
