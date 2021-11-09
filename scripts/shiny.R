library(shiny)
library(ggplot2)
library(readr)
library(lubridate)
library(plotly)
library(ggalt)
library(leaflet)
#setwd("C:\Users\jpan0\OneDrive\Documents\GitHub\Bios-611-project\derived_data\Local_Air_Quality_Cleaned.csv.\\")
weather <- read_csv("Local_Air_Quality_Cleaned.csv")[c(-1,-2),]
weather$Last_Check <- gsub("\\+00","",weather$Last_Check)
weather$Last_Check <- ymd_hms(weather$Last_Check)
weather$ydm <- floor_date(weather$Last_Check,"day" )
weather <- weather%>%
  mutate(year=year(ydm),month=month(ydm),day=day(ydm))
weather <- weather[!duplicated(weather$Last_Check),]


ui = bootstrapPage(fluidPage(
  navbarPage(
    "Air Quality",
  sidebarLayout(
    sidebarPanel(
    selectInput("year", "Year", choices = c(2018,2019)),
    selectInput("month", "Month", choices = c(1:12)),
    selectInput("day", "Day", choices = c(1:31)),
    
    

    ),
    
    
  
  mainPanel(tabsetPanel(id = 'tabs',
                        tabPanel('PM25 Minute Avg', plotlyOutput('plot1'), plotlyOutput('plot2')),
                        tabPanel('PM25 Hour Avg', plotlyOutput('plot3'), plotlyOutput('plot4'), plotlyOutput('plot5')),
                        tabPanel('PM25 Week Avg', plotlyOutput('plot6')),
                        tabPanel('PM25 Temp Humidity&Pressure', plotlyOutput('plot8')),
                        tabPanel('MAp',leafletOutput(outputId="distPlot"))
  )
  )
  ))))


server <- function(input, output){
 
   output$plot1 <- renderPlotly({

    
    weather%>%
      filter(year==input$year)%>%
      filter(month==input$month)%>%
      ggplot(aes(x=Last_Check,y=PM_2_5_10_Minute_Avg))+
      geom_line(color="4")+
       xlab("Last Check") +   
       ylab("PM2.5 by 10-Minute-Avg") +   
       ggtitle("")
    
  })
  
  output$plot2 <- renderPlotly({


    weather%>%
      filter(year==input$year)%>%
      filter(month==input$month)%>%
      ggplot(aes(x=Last_Check,y=PM_2_5_30_Minute_Avg))+
      geom_line(color="5")+
      xlab("Last Check") +   
      ylab("PM2.5 by 30-Minute-Avg") +   
      ggtitle("")
    
    
  })
  output$plot3 <- renderPlotly({

      
    weather%>%
      filter(year==input$year)%>%
      filter(month==input$month)%>%
      ggplot(aes(x=Last_Check,y=PM_2_5_1_Hour_Avg))+
      geom_line(color="5")+
      xlab("Last Check") +   
      ylab("PM2.5 by 1-Hour-Avg") +   
      ggtitle("")
  
    
    })
  
  output$plot4 <- renderPlotly({

    
    weather%>%
      filter(year==input$year)%>%
      filter(month==input$month)%>%
      ggplot(aes(x=Last_Check,y=PM_2_5_6_Hour_Avg))+
      geom_line(color="5")+
      xlab("Last Check") +   
      ylab("PM2.5 by 6-Hour-Avg") +   
      ggtitle("")
 
  })
 
  
  output$plot5 <- renderPlotly({
    
    
    weather%>%
      filter(year==input$year)%>%
      filter(month==input$month)%>%
      ggplot(aes(x=Last_Check,y=PM_2_5_24_Hour_Avg))+
      geom_line(color="5")+
      xlab("Last Check") +   
      ylab("PM2.5 by 24-Hour-Avg") +   
      ggtitle("")
    
  })
  
  
  output$plot6 <- renderPlotly({
    
    
    weather%>%
      filter(year==input$year)%>%
      filter(month==input$month)%>%
      ggplot(aes(x=Last_Check,y=PM_2_5_One_Week_Avg))+
      geom_line(color="5")+
      xlab("Last Check") +   
      ylab("PM2.5 by 1-week-Avg") +   
      ggtitle("")
    
  })
  
  output$plot8 <- renderPlotly({
    
    
    weather%>%
      filter(year==input$year)%>%
      filter(month==input$month)%>%
      select(Last_Check,PM_2_5_One_Week_Avg,Temp__F,Humidity,Pressure__mbar)%>%
      mutate(Pressure__mbar=Pressure__mbar/40)%>%
      tidyr::gather(type,value,-Last_Check)%>%
      ggplot(aes(x=Last_Check,y=value,group=type))+
      geom_line(aes(linetype=type,color=type))+
      xlab("Last Check") +   
      ylab("PM25 Temp Humidity&Pressure") +   
      ggtitle("")
    
  })
  
  
  

  output$distPlot <- renderLeaflet({
a <- weather%>%
      filter(ydm==as.Date(paste(input$year,"-",input$month,"-",input$day,sep = ""),"%Y-%m-%d"))

    leaflet() %>% addTiles() %>%
      addMarkers(lng = a$Longitude, lat = a$Latitude, popup = paste(a$Site_Label,":",a$PM_2_5_30_Minute_Avg,sep = ""))  
    
    
    
  })
}

shinyApp(ui,server)


