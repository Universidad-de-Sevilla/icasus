<?php
/** Memory limit */
ini_set('memory_limit', '2G');

/** Error reporting */
error_reporting(E_ALL);

/** Include path **/
set_include_path(get_include_path() . PATH_SEPARATOR . '../Classes/');

/** PHPExcel */
include 'PHPExcel.php';

/** PHPExcel_IOFactory */
include 'PHPExcel/IOFactory.php';

function buildandWrite($name)
{

    $objPHPExcel = new PHPExcel();


    $justSomeData = array(
                    "My Name For this", "MyCodeMyCode", "My Description",
		            "My long description is not really very long",
		            "Fantasy Land"
            );

    // Add some data 

    $title = array("Name", "Code", "Description", "Long desc", "Country");
    for($yr = 2000; $yr < 2010; $yr++)
    {
        $title[] = "Year $yr";
    }
    $col = 0;
    $row = 1;
    
    for($i = 0; $i < count($title); $i++)
    {
        $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++,
			$row, $title[$i]);   
    }

    for($row = 2; $row < 3000; $row++)
    {
        $col = 0;
        for($i = 0; $i < count($justSomeData); $i++)
        {
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++,
	    		$row, $justSomeData[$i]);    
        }
        for($yr = 2000; $yr < 2010; $yr++)
        {
            $value = number_format(floatval($yr)*floatval($row)/floatval($col+1), 4, '.', ',');
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col++,
	    		$row, $value);    
        }
    }


    $objPHPExcel->getActiveSheet()->setTitle('Simple');


    // Set active sheet index to the first sheet, so Excel opens this as the first sheet
    $objPHPExcel->setActiveSheetIndex(0);

    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
    $objWriter->save($name);
}

if (!is_dir("out"))
{
    mkdir("out");
}

for($i = 1; $i < 2; $i++)
{
    $fn = sprintf("out/Example_%05d.xlsx", $i); 
    echo date('H:i:s') . " Before File ".$fn."  - Memory usage: " . 
                    (memory_get_usage (true) / 1024 / 1024) . " MB\r\n";
    buildandWrite($fn);
    // Echo memory peak usage
    echo date('H:i:s') . " Done File ".$fn."  - Memory usage: " . 
                    (memory_get_usage (true) / 1024 / 1024) . " MB\r\n\r\n";

}



?>
