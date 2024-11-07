

#Fórmula para Cálculo de Valor Futuro (VF) con anualidad anticipada

VF=function(A,r,n){
  
  VFsalida=(A*((((1+r)^n)-1)/r)*(1+r))
  return(VFsalida)
}

#Fómula para cálculo de Anualidad (A)

A=function(VF,r,n){
  
  Asalida=(VF*r)/((((1+r)^n)-1)*(1+r))
  
  return(Asalida)
}

#Formula para cálculo de numero de plazos (n)

n=function(VF,A,r){
  
  nsalida=(log((((VF*r)/(A*(1+r)))+1))/log(1+r))
  
  return(nsalida)
}

#Calculo de la Tasa del Periodo(r)


#Calculo de la Tasa del Periodo(r)
##Conociendo VF,T,A

rTasa=function(VF,A,n,paro=10*(10^-18)){
  
  r=0.01
  iteraciones=0
  
  izquierda=VF/A
  derecha=(((1 + r)^n - 1) / r) * (1 + r)
  diferencia=izquierda-derecha
  
  if (diferencia>0){
    # Cuando la r inicial es menor a lo deseado:  
    # Algoritmo de alza de tasa:
    
    iteraciones=0
    r0=r
    while (diferencia>0){
      r1=r  
      iteraciones=iteraciones+1  
      r=r*1.01
      
      izquierda=VF/A
      derecha=(((1 + r)^n - 1) / r) * (1 + r)
      diferencia=izquierda-derecha
      cat("\f")
      print(paste0("Iteración de alza tasa:",iteraciones))
      
      r2=r
      
    }  
    
    
    #diferencia1=diferencia
    diferenciaTasa=r-r0
    diferencia=paro
    # algoritmo de la bisección:    
    while (abs(diferenciaTasa)>paro){
      
      iteraciones=iteraciones+1
      r=(r1+r2)/2    
      
      izquierda=VF/A
      derecha = (((1 + r)^n - 1) / r) * (1 + r)
      diferencia=izquierda-derecha
      
      if (diferencia>0){
        r1=r1
        r2=r
        
      } else {
        r2=r2  
        r1=r
        
      }
      diferenciaTasa=r-r0
      r0=r
      cat("\f")
      print(paste0("Iteración de bisección: ",iteraciones))
    }
    
  } else {
    # Cuando la r inicial es mayor a lo deseado:  
    # Algoritmo de bajada de tasa:
    iteraciones=0
    r0=r
    while (diferencia<0){
      r2=r 
      iteraciones=iteraciones+1  
      r=r/1.01
      
      izquierda=VF/A
      derecha=(((1 + r)^n - 1) / r) * (1 + r)
      diferencia=izquierda-derecha
      
      cat("\f")
      print(paste0("Iteración de baja de tasa:",iteraciones))
      
      r1=r
      
    }  
    
    
    #diferencia1=diferencia
    diferenciaTasa=r-r0
    r0=r
    
    diferencia=paro  
    
    # algoritmo de la bisección:      
    while (abs(diferenciaTasa)>paro){
      iteraciones=iteraciones+1
      r=(r1+r2)/2    
      
      izquierda=VF/A
      derecha=(((1 + r)^n - 1) / r) * (1 + r)
      diferencia=izquierda-derecha
      
      if (diferencia>0){
        r1=r
        r2=r2
        
      } else {
        r2=r  
        r1=r1
        
      }
      
      diferenciaTasa=r-r0
      r0=r
      
      cat("\f")
      print(paste0("Iteración de biseccción:",iteraciones))
    }
    
    
    
  }
  return(r)
}



#Fórmula para Cálculo del Valor Actual (VA) con anualidad anticipada

VA=function(A,r,n){
  
  VAsalida= A*(1-((1+r)^(-n)))/r*(1+r)
               
  return(VAsalida)
}

#Fómula para cálculo de Anualidad (A) con Valor Actual

AVA=function(VA,r,n){
  
  AVAsalida=(VA*r)/((1-(1+r)^(-n))*(1+r))
  
  return(AVAsalida)
}

#Formula para cálculo de numero de plazos (n) con Valor Actual

nVA=function(VA,A,r){
  
  nVAsalida=-(log(1-((VA*r)/(A*(1+r))))/log(1+r))
  
  return(nVAsalida)
}


#Calculo de la Tasa del Periodo(r) con Valor Actual


rTasaVA=function(VA,A,n,paro=10*(10^-18)){
  
  r=0.001
  iteraciones=0
  
  izquierda=VA/A
  derecha=((1-(1+r)^(-n))/r)*(1 + r)
  diferencia=izquierda-derecha
  
  if (diferencia<0){
    # Cuando la r inicial es menor a lo deseado:  
    # Algoritmo de alza de tasa:
    
    iteraciones=0
    r0=r
    while (diferencia<0){
      r1=r  
      iteraciones=iteraciones+1  
      r=r*1.01
      
      izquierda=VA/A
      derecha=((1-(1+r)^(-n))/r)*(1 + r)
      diferencia=izquierda-derecha
      cat("\f")
      print(paste0("Iteración de alza tasa:",iteraciones))
      
      r2=r
      
    }  
    
    
    #diferencia1=diferencia
    diferenciaTasa=r-r0
    diferencia=paro
    # algoritmo de la bisección:    
    while (abs(diferenciaTasa)>paro){
      
      iteraciones=iteraciones+1
      r=(r1+r2)/2    
      
      izquierda=VA/A
      derecha=((1-(1+r)^(-n))/r)*(1 + r)
      diferencia=izquierda-derecha
      
      if (diferencia>0){
        r1=r1
        r2=r
        
      } else {
        r2=r2  
        r1=r
        
      }
      diferenciaTasa=r-r0
      r0=r
      cat("\f")
      print(paste0("Iteración de bisección: ",iteraciones))
    }
    
  } else {
    # Cuando la r inicial es mayor a lo deseado:  
    # Algoritmo de bajada de tasa:
    iteraciones=0
    r0=r
    while (diferencia>0){
      r2=r 
      iteraciones=iteraciones+1  
      r=r/1.01
      
      izquierda=VA/A
      derecha=((1-(1+r)^(-n))/r)*(1 + r)
      diferencia=izquierda-derecha
      cat("\f")
      print(paste0("Iteración de baja de tasa:",iteraciones))
      
      r1=r
      
    }  
    
    
    #diferencia1=diferencia
    diferenciaTasa=r-r0
    r0=r
    
    diferencia=paro  
    # algoritmo de la bisección:      
    while (abs(diferenciaTasa)>paro){
      iteraciones=iteraciones+1
      r=(r1+r2)/2    
      
      izquierda=VA/A
      derecha=((1-(1+r)^(-n))/r)*(1 + r)
      diferencia=izquierda-derecha
      
      if (diferencia>0){
        r1=r
        r2=r2
        
      } else {
        r2=r  
        r1=r1
        
      }
      
      diferenciaTasa=r-r0
      r0=r
      
      cat("\f")
      print(paste0("Iteración de biseccción:",iteraciones))
    }
    
  }
  
  return(r)
}
