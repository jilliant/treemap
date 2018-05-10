# json format

df <- "[
  {name: 'Thanos and Friends',
  value: 34,
  children:[
  {name: 'The Black Order',
  value: 15,
  children:[
  {name: 'Ebony Maw',
  value: 4
  },
  {name: 'Proxima Midnight',
  value: 3.75
  },
  {name: 'Cull Obsidia',
  value: 3.75
  },
  {name: 'Corvus Glaive',
  value: 3.5
  }
  ]
  },
  {name: 'Thanos',
  value: 29
  }
  ]
  },
  {name: 'Guardians of the Galaxy',
  value: 51.75,
  children: [
  {name : 'Peter Quill/Star-Lord',
  value: 10.25
  },
  {name:'Gamora',
  value: 19.5
  },
  {name:'Rocket',
  value: 6
  },
  {name:'Drax',
  value: 4.75
  },
  {name:'Mantis',
  value: 4.75
  },
  {name:'Nebula',
  value: 3.25
  },
  {name:'Groot',
  value: 3.25
  }
  ]
  },
  {name: 'Tony Stark/Iron Man',
  value: 18
  },
  {name: 'Asgardians',
  value: 17.75,
  children: [
  {name : 'Thor',
  value: 14.5
  },
  {name:'Loki',
  value: 3.25
  },
  {name: 'Heimdall',   
  value: 0.75 
  }
  ]
  },
  {name: 'Masters of the Mystic Arts',
  value: 14.25,
  children: [
  {name : 'Dr. Stephen Strange',
  value: 11.5
  },
  {name:'Wong',
  value: 2.75
  }
  ]
  },
  {name: 'Wakandans',
  value: 8.75,
  children:[
  {name: 'Wakandans',
  value: 5.25,
  children:[
  {name: 'Okoye',
  value: 3.25
  },
  {name: 'Princess Shurit',
  value: 1
  },
  {name: 'M Baku',
  value: 1
  }
  ]
  },
  {name: 'King T Challa/Black Panther',
  value: 3.5
  }
  ]
  },
  {name: 'Vision',   
  value: 9.75  
  },
  {name: 'Wanda Maximoff/Scarlet Witch',   
  value: 9
  },
  {name: 'Natasha Romanoff/Black Widow',   
  value: 5 
  },
  {name: 'Dr. Bruce Banner/The Hulk',   
  value: 8.75  
  },
  {name: 'Peter Parker/Spider-Man',   
  value: 7.5  
  },
  {name: 'Steve Rogers/Captain America',   
  value: 6.75  
  },
  {name: 'Col. James Rhodes/War Machine',
  value: 3  
  },
  {name: 'Sam Wilson/Falcon',   
  value: 2.25 
  },
  {name: 'Eitri',   
  value: 2.75  
  },
  {name: 'James Bucky Barnes/White Wolf',   
  value: 2  
  },
  {name: 'Pepper Potts',   
  value: 1.5  
  },
  {name: 'The Stonekeeper',   
  value: 1.5
  },
  {name: 'Taneleer Tivan/The Collector',   
  value: 0.75  
  }, 
  {name: 'S.H.I.E.L.D',
    value: 1.75,
  children:[
  {name: 'Nick Fury',
  value: 1
  },
  {name: 'Maria Hill',
  value: 0.75
  }
  ]
  }
  ]"

# Then Get Shiny ----
library(shiny)
library(ECharts2Shiny)

# ui ----
ui <- fluidPage(
  
  # Need to Load the ECharts libraries 
  loadEChartsLibrary(),
  loadEChartsTheme("infographic"),
  
  # Bring in the chart
  tags$div(id="test", style="width:100%;height:1800px;"),
  deliverChart(div_id = "test")
)

# server ----
server <- function(input, output) {
  
  renderTreeMap(div_id = "test",
                data = df, 
                name = "Infinity War",
                theme = "infographic", # must match ui
                show.tools = TRUE)
}

# Run the application 
shinyApp(ui = ui, server = server)
