<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-question-circle fa-fw"></i> {$_nombre_pagina}
        </h3>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<!-- Breadcrumbs -->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <i title="{$smarty.const.TXT_ESTA}" class="fa fa-map-marker fa-fw"></i>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-8">
        {$pagina->contenido}
    </div>
    <!-- /.col-lg-8 -->
</div>
<!-- /.row -->
<hr>
<!-- Barra de botones -->
<div class="row">
    <div class="col-lg-12">
        <div class="btn-toolbar" role="toolbar" aria-label="">
            {if $admin}
                <div class="btn-group" role="group" aria-label="">
                    <a title="{$smarty.const.TXT_PAG_CREAR}" class="btn btn-default btn-danger" href="index.php?page=pagina_crear"><i class="fa fa-file-text fa-fw"></i><sub class="fa fa-plus fa-fw"></sub></a>
                    <a title="{$smarty.const.TXT_PAG_EDIT}" class="btn btn-default btn-danger" href="index.php?page=pagina_editar&id_pagina={$pagina->id}"><i class="fa fa-file-text fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub></a>
                </div>
            {/if}
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_VOLVER_INDICE}" class="btn btn-default btn-danger" href='index.php?page=pagina_mostrar&alias=indice'><i class="fa fa-arrow-left fa-fw"></i></a>
            </div>
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Barra de botones -->