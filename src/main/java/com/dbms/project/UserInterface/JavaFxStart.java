package com.dbms.project.UserInterface;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ConfigurableApplicationContext;

import com.dbms.project.ProjectApplication;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.stage.Stage;

public class JavaFxStart extends Application {
    private ConfigurableApplicationContext context;
    
    @Override
    public void init() throws Exception{
        this.context=new SpringApplicationBuilder()
                .sources(ProjectApplication.class)
                .run(getParameters().getRaw().toArray(new String[0]));
    }

    @Override
    public void start(Stage primaryStage){
        context.publishEvent(new StageReadyEvent(primaryStage));
    }

    @Override
    public void stop(){
        context.close();
        Platform.exit();
    }
}
