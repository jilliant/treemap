# Generate Fake data

# "Thanos" - 29  
# "The Black Order"
# "Ebony Maw" - 4  
# "Proxima Midnight" - 3.75  
# "Cull Obsidian" - 3.75  
# "Corvus Glaive" - 3.5  

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
  }
  ]"

# Then Get Shiny ----
library(shiny)
library(ECharts2Shiny)

# ui ----
ui <- fluidPage(
   
  # Need to Load the ECharts libraries 
  loadEChartsLibrary(),
  loadEChartsTheme("macarons"),
  
  # Bring in the chart
  tags$div(id="test", style="width:100%;height:500px;"),
  deliverChart(div_id = "test")
)

# server ----
server <- function(input, output) {
   
  renderTreeMap(div_id = "test",
                data = df, 
                name = "Infinity War",
                theme = "macarons", # must match ui
                show.tools = TRUE)
}

# Run the application 
shinyApp(ui = ui, server = server)

