package com.dbms.project.controller;

import org.springframework.stereotype.Component;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import lombok.extern.log4j.Log4j2;
import net.rgielen.fxweaver.core.FxWeaver;
import net.rgielen.fxweaver.core.FxmlView;

@FxmlView
@Component
@Log4j2
public class MainController {
    private final FxWeaver fxWeaver;

    @FXML
    public Button openDialogButton;
    @FXML
    public Button openEmployeeDialog;
    @FXML
    public Button openAnimalDialog;
    @FXML
    public Button openBuildingDialog;
    @FXML
    public Button openRevenueTypesDialog;
    @FXML
    public Button openRevenueEventsDialog;
    @FXML
    public Button openReportsDialog;

    public MainController(FxWeaver fxWeaver){
        this.fxWeaver=fxWeaver;
    }
}
