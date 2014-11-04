<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/grafica.php
// Tipo: clase
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea gráficas utilizando la libreria pChart 2.1.3
//---------------------------------------------------------------------------------------------------

class Grafica
{

    private $font_path;
    private $pchart;

    public function Grafica($ancho = 650, $alto = 170)
    {
        require_once("../../cascara_core/lib/pChart2/pChart/pData.class");
        require_once("../../cascara_core/lib/pChart2/pChart/pChart.class");
        $this->font_path = IC_DIR_BASE . '../../cascara_core/lib/pChart2/Fonts/tahoma.ttf';
        $this->ancho = $ancho;
        $this->alto = $alto;
        // Inicializa el grafico  
        $this->pchart = new pChart($this->ancho, $this->alto);
        $this->pchart->setColorPalette(0, 0, 119, 170); //Cambiamos la paleta de la primera serie
        $this->pchart->setColorPalette(0, 0, 0, 0); //Cambiamos la paleta de la primera serie
        $this->pchart->setColorPalette(1, 150, 22, 56); //Cambiamos la paleta de la primera serie
        $this->pchart->setFontProperties($this->font_path, 10);
        $this->pchart->setGraphArea(60, 20, ($this->ancho * 95 / 100), ($this->alto * 85 / 100));
    }

    public function dibuja($ruta_imagen, $datos)
    {
        $this->pchart->drawGraphArea(252, 252, 252);
    }

    // En desuso
    public function dibuja_indicador($ruta_imagen, $datos)
    {
        // Prepara los datos del indicador para pasarlos a un dataset
        foreach ($datos as $dato)
        {
            $valores[] = $dato['valor'];
            $periodos[] = date("m/y", $dato['fecha_recogida']);
            $objetivos[] = $dato['objetivo'];
            $objetivos_estrategicos[] = $dato['objetivo_estrategico'];
            $objetivos_carta[] = $dato['objetivo_carta'];
            //$serie0[] = 0;
        }

        // Prepara dataset   
        $dataset = new pData;
        $dataset->AddPoint($valores, "Valores");
        $dataset->AddPoint($objetivos, "Objetivo");
        $dataset->AddPoint($objetivos_estrategicos, "Objetivo Pactado");
        $dataset->AddPoint($objetivos_carta, "Objetivo Carta");
        $dataset->AddPoint($periodos, "Periodo");
        //$dataset->AddPoint($serie0,"Serie0");
        $dataset->AddSerie("Valores");
        $dataset->AddSerie("Objetivo");
        $dataset->AddSerie("Objetivo Pactado");
        $dataset->AddSerie("Objetivo Carta");
        $dataset->SetAbsciseLabelSerie("Periodo");
        $dataset->SetSerieName("Valores", "Valores");
        $dataset->SetSerieName("Objetivo", "Objetivo");
        $dataset->SetSerieName("Objetivo Pactado", "Objetivo Pactado");
        $dataset->SetSerieName("Objetivo Carta", "Objetivo Carta");
        //$dataset->SetXAxisFormat("date"); 
        // Inicializa el grafico  
        $grafica = new pChart($this->ancho, $this->alto);
        $grafica->setColorPalette(0, 0, 119, 170); //Cambiamos la paleta de la primera serie
        $grafica->setColorPalette(0, 0, 0, 0); //Cambiamos la paleta de la primera serie
        $grafica->setColorPalette(1, 150, 22, 56); //Cambiamos la paleta de la primera serie
        $grafica->setFontProperties($this->font_path, 10);
        $grafica->setGraphArea(60, 20, ($this->ancho * 95 / 100), ($this->alto * 85 / 100));
        $grafica->drawGraphArea(252, 252, 252);
        $dataset->GetData(); //debug
        $dataset->GetDataDescription(); //debug
        // Aquí murió un bug que se resistió durante diez dias, descanse en paz
        //$grafica->drawScale($dataset->GetData(),$dataset->GetDataDescription(),SCALE_NORMAL,150,150,150,TRUE,0,2);  
        $grafica->drawScale($dataset->GetData(), $dataset->GetDataDescription(), SCALE_START0, 150, 150, 150, TRUE, 0, 2, TRUE, 1, FALSE);
        //drawScale($Data,$DataDescription,$ScaleMode,$R,$G,$B,$DrawTicks=TRUE,$Angle=0,$Decimals=1,$WithMargin=FALSE,$SkipLabels=1,$RightScale=FALSE)
        $grafica->drawGrid(4, TRUE, 230, 230, 230, 255);

        // Dibuja el grafico
        $grafica->setLineStyle(1, 1); //grosor y estilo de la línea
        $grafica->drawLineGraph($dataset->GetData(), $dataset->GetDataDescription());
        //$grafica->drawArea($dataset->GetData(),"Objetivo","Serie0",150,22,56,20);
        //$grafica->drawArea($dataset->GetData(),"Objetivo Pactado","Serie0",150,22,56,50);
        //$grafica->drawArea($dataset->GetData(),"Objetivo Carta","Serie0",150,22,26,20);
        $dataset->RemoveSerie("Objetivo");
        $dataset->RemoveSerie("Objetivo Pactado");
        $dataset->RemoveSerie("Objetivo Carta");
        $grafica->drawPlotGraph($dataset->GetData(), $dataset->GetDataDescription(), 3, 2, 255, 255, 255);
        $grafica->setFontProperties($this->font_path, 10);
        $grafica->writeValues($dataset->GetData(), $dataset->GetDataDescription(), "Valores");

        // Termina el grafico
        $grafica->setFontProperties($this->font_path, 8);
        $dataset->AddSerie("Objetivo");
        $dataset->AddSerie("Objetivo Pactado");
        $dataset->AddSerie("Objetivo Carta");
        //$grafica->drawLegend(70,25,$dataset->GetDataDescription(),255,255,235);  
        $grafica->setFontProperties($this->font_path, 10);
        //$grafica->drawTitle(60,22,"Valores del indicador",50,50,50,585);
        $grafica->Render($ruta_imagen);
    }

}
