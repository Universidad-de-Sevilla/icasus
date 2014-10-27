<div id="wrapper">		

      {if isset($_usuario)}{include file='menu.tpl'}{/if}
      
			<div id="main_container" class="main_container container_16 clearfix">
				<div id="nav_top" class="clearfix round_top">

        <script type="text/javascript">
          var currentPage = 6 - 1; // This is only used in php to tell the nav what the current page is
          $('#nav_top > ul > li').eq(currentPage).addClass("current");
          $('#nav_top > ul > li').addClass("icon_only").children("a").children("span").parent().parent().removeClass("icon_only");
        </script>
	
        <div id="mobile_nav">
         <!-- <div class="main"></div> -->
          <div class="side"></div>
        </div>

      </div><!-- #nav_top -->

      <div class="flat_area grid_16">
        
      <div>
        <h2>{$_nombre_pagina}</h2>
      </div>

        {if isset($smarty.get.error)}
          <div class="alert dissmisible alert_red">
            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alarm_bell.png"> 
            {$smarty.get.error}
          </div>
        {/if}
        {if isset($error)}
          <div class="alert dissmisible alert_red">
            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alarm_bell.png"> 
            {$error}
          </div>
        {/if}
        {if isset($smarty.get.aviso)}
          <div class="alert dissmisible alert_blue">
            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png"> 
            {$smarty.get.aviso}
          </div>
        {/if}
        {if isset($aviso)}
          <div class="alert dissmisible alert_blue">
            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png"> 
            {$aviso}
          </div>
        {/if}
