package com.dbms.project.UserInterface;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.dbms.project.controller.MainController;

import javafx.scene.Scene;
import javafx.stage.Screen;
import javafx.stage.Stage;
import net.rgielen.fxweaver.core.FxWeaver;

@Component
public class PrimaryStageInitializer implements ApplicationListener<StageReadyEvent>{
    private final FxWeaver fxWeaver;
    @Autowired
    public PrimaryStageInitializer(FxWeaver fxWeaver){
        this.fxWeaver=fxWeaver;
    }
    
    @Override 
    public void onApplicationEvent(StageReadyEvent event){
        Stage stage=event.stage;

        double width=Screen.getPrimary().getBounds().getWidth()*0.6;
        double height=Screen.getPrimary().getBounds().getWidth()*0.6;

        Scene scene= new Scene(fxWeaver.loadView(MainController.class),width,height);
        stage.setScene(scene);
        stage.show();
    }
}
