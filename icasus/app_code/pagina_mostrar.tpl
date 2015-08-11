<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h2 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-question-circle fa-fw"></i> {$_nombre_pagina}
        </h2>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<div class="row">
    <div class="col-lg-12">
        {$pagina->contenido}
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>

<!-- Barra de botones -->
<div class="row">
    <div class="col-lg-12">
        <div class="btn-toolbar" role="toolbar" aria-label="">
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_PAG_NUEVA}" class="btn btn-default btn-danger" href="index.php?page=pagina_crear"><i class="fa fa-plus-circle fa-fw"></i> {$smarty.const.TXT_PAG_NUEVA}</a>
                <a title="{$smarty.const.TXT_PAG_EDIT}" class="btn btn-default btn-danger" href="index.php?page=pagina_editar&id_pagina={$pagina->id}"><i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_PAG_EDIT}</a>
                <a title="{$smarty.const.TXT_VOLVER_INDICE}" class="btn btn-default btn-danger" href='index.php?page=pagina_mostrar&alias=indice'><i class="fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_VOLVER_INDICE}</a>
            </div>
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Barra de botones -->