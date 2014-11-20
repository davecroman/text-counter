package com.example.controller;

import org.junit.Before;

import java.util.Map;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.*;
import static org.mockito.Mockito.mock;

public class HomeControllerTest {

    private HomeController homeController;

    @Before
    public void setUp(){
        this.homeController = new HomeController();
    }

    @org.junit.Test
    public void testGoHome() {
        String view = homeController.goHome(mock(Map.class));

        assertThat(view, is("textcounter"));
    }
}