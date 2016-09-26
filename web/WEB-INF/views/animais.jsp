<%--
  Grupo Meta
  Teste
  Daniel Pinheiro Vargas
  Criado em 25/09/2016.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">

<%-- JSTL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- Spring --%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Teste Meta">
    <meta name="author" content="Daniel Vargas">

    <title>Teste Meta | Cadastro Animais</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font-Awesome -->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Animação CSS -->
    <link href="assets/css/animate.css" rel="stylesheet">

    <!-- Sweet Alert -->
    <link href="assets/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

    <!-- Toastr style -->
    <link href="assets/css/plugins/toastr/toastr.min.css" rel="stylesheet">

    <!-- Data Tables -->
    <link href="assets/css/plugins/DataTables1.10.12/DataTables-1.10.12/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="assets/css/plugins/DataTables1.10.12/Buttons-1.2.2/css/buttons.dataTables.min.css" rel="stylesheet">

    <!--Sky Forms Pro -->
    <link href="assets/css/plugins/sky-forms-pro/skyforms/css/sky-forms.css" rel="stylesheet">
    <!--[if lt IE 9]><link rel="stylesheet" href="assets/css/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

    <!-- Custom styles -->
    <link href="assets/css/style.css" rel="stylesheet">

    <link href="assets/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="assets/css/plugins/iCheck/custom.css" rel="stylesheet">
</head>
<body class="pace-done skin-1">

<div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-rounded" src="assets/img/logo.jpg" />
                             </span>
                        <a href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">Teste Meta</strong>
                             </span>  </span> </a>

                    </div>
                    <div class="logo-element">
                        Meta
                    </div>
                </li>
                <li>
                    <a href="<c:url value="/animal.action"/>"><i class="fa fa-linux"></i> <span class="nav-label">Animais</span></a>
                </li>
            </ul>
        </div>
    </nav>

    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top  " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-success " href="#"><i class="fa fa-bars"></i> </a>
                </div>
            </nav>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-4">
                <h2>Animais Cadastrados</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">
                        <strong>Cadastro Animais</strong>
                    </li>
                </ol>
            </div>
            <div class="col-sm-8">
                <div class="title-action">
                    <a data-toggle="modal" class="btn btn-success" href="#modal-form">Novo Animal</a>
                </div>
            </div>
        </div>

        <div class="modal inmodal" id="modal-form" tabindex="-1" role="dialog"  aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated fadeIn">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                        <h4 class="modal-title">Novo Animal</h4>
                    </div>

                    <c:url var="action" value="/animal/save.action"/>
                    <form:form accept-charset="utf-8" role="form" id="formAnimal" modelAttribute="animal" class="sky-form resetar" method="post" action="${action}">
                        <div class="modal-body">

                            <form:hidden path="idAnimal"/>

                            <c:url var="urlGetOrdensByClasse" value="/ajax/ordem/getOrdens.action"/>
                            <div class="form-group">
                                <label>Classe *</label>
                                <label class="input">
                                    <select id="classe" class="form-control m-b" onchange="getOrdens({urlGetOrdens:'${urlGetOrdensByClasse}'})">
                                        <option value="">---Selecione---</option>
                                        <c:forEach var="c" items="${classes}">
                                            <option value="${c.idClasse}">${c.descricao}</option>
                                        </c:forEach>
                                    </select>
                                </label>
                            </div>

                            <div class="form-group">
                                <label>Ordem *</label>
                                <label class="input">
                                    <form:select path="ordem" class="form-control m-b">
                                        <form:option value="">--- Selecione primeiramente uma Classe ---</form:option>
                                    </form:select>
                                </label>
                            </div>

                            <div class="form-group">
                                <label>Nome *</label>
                                <label class="input">
                                    <form:input path="nome" class="form-control"/>
                                </label>
                            </div>

                            <div class="form-group">
                                <label>NomeCientifico *</label>
                                <label class="input">
                                    <form:input id="nomeCientifico" path="nomeCientifico" class="form-control"/>
                                </label>
                            </div>

                            <div class="form-group">
                                <label>Habitat</label>
                                <label class="input">
                                    <form:select path="habitat" class="form-control m-b">
                                        <form:option value="">--- Selecione ---</form:option>
                                        <form:options items="${habitats}" itemLabel="descricao" itemValue="idHabitat"/>
                                    </form:select>
                                </label>
                            </div>

                            <div class="form-group">
                                <label class="checkbox-inline i-checks">
                                    <input type="checkbox" id="indAmeacado" name="indAmeacado" value="1" checked> <strong>Ameaçado Extinção</strong>
                                </label>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <button type="reset" id="resetForm" class="btn btn-white">Cancelar</button>
                            <button type="submit" class="btn btn-success">Salvar</button>
                        </div>
                    </form:form>
                </div>
            </div>

        </div>


        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Animais Cadastrados</h5>
                            <div class="ibox-tools">

                            </div>
                        </div>
                        <div class="ibox-content">

                            <div class="table-responsive">
                                <table id="example" class="display" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>IdAnimal</th>
                                        <th>Classe</th>
                                        <th>Ordem</th>
                                        <th>Nome</th>
                                        <th>Nome Cinetífico</th>
                                        <th>Habitat</th>
                                        <th>Ameaçado</th>
                                        <th>Ações</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="pull-right">

            </div>
            <div>
                <strong>Copyright</strong> Daniel Vargas &copy; 2016
            </div>
        </div>

    </div>
</div>

<!-- Mainly scripts -->
<script src="assets/js/jquery-2.1.1.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="assets/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Data Tables -->
<script src="assets/css/plugins/DataTables1.10.12/DataTables-1.10.12/js/jquery.dataTables.min.js"></script>
<script src="assets/css/plugins/DataTables1.10.12/Buttons-1.2.2/js/dataTables.buttons.min.js"></script>
<script src="assets/css/plugins/DataTables1.10.12/JSZip-2.5.0/jszip.min.js"></script>
<script src="assets/css/plugins/DataTables1.10.12/pdfmake-0.1.18/build/pdfmake.min.js"></script>
<script src="assets/css/plugins/DataTables1.10.12/pdfmake-0.1.18/build/vfs_fonts.js"></script>
<script src="assets/css/plugins/DataTables1.10.12/Buttons-1.2.2/js/buttons.html5.min.js"></script>
<script src="assets/css/plugins/DataTables1.10.12/Buttons-1.2.2/js/buttons.colVis.min.js"></script>
<script src="assets/css/plugins/DataTables1.10.12/Buttons-1.2.2/js/buttons.print.js"></script>


<!-- Custom and plugin javascript -->
<script src="assets/js/inspinia.js"></script>
<script src="assets/js/plugins/pace/pace.min.js"></script>

<!--Sky Forms Pro -->
<script src="assets/css/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>

<!-- Select2 -->
<script src="assets/js/plugins/select2/select2.full.min.js"></script>

<!-- Sweet alert -->
<script src="assets/js/plugins/sweetalert/sweetalert.min.js"></script>

<!-- Toastr script -->
<script src="assets/js/plugins/toastr/toastr.min.js"></script>


<script>

    var Validation = function () {

        return {

            initValidation: function () {

                $("#formAnimal").validate({
                    rules: {
                        classe: {
                            required: true
                        },
                        ordem: {
                            required: true
                        },
                        nome: {
                            required: true
                        },
                        nomeCientifico: {
                            required: true
                        }
                    },
                    messages:
                    {
                        classe: {
                            required: 'Campo Classe &eacute; obrigat&oacute;rio!'
                        },
                        ordem: {
                            required: 'Campo Ordem &eacute; obrigat&oacute;rio!'
                        },
                        nome: {
                            required: 'Campo Nome &eacute; obrigat&oacute;rio!'
                        },
                        nomeCientifico: {
                            required: 'Campo Nome Cientifico &eacute; obrigat&oacute;rio!'
                        }
                    },
                    errorPlacement: function(error, element)
                    {
                        error.insertAfter(element.parent());
                    }
                });

            }
        };
    }();

    $('#resetForm').on('click', function () {
        $(".resetar").validate().resetForm();
    });

    $('.resetar').on('reset', function() {
        var $form = $(this);
        $form.find('.error,.valid').css('border-color', '').removeClass('error').removeClass('valid');
        $form.find('.form-error').remove();
        $form.find('.state-error').removeClass('state-error');
        $form.find('.state-success').removeClass('state-success');
    });
</script>

<!-- iCheck -->
<script src="assets/js/plugins/iCheck/icheck.min.js"></script>
<script>

    $(document).ready(function(){

        Validation.initValidation();

        table = $('#example').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    text: '<i class="fa fa-file-text-o"></i> &nbsp; Salvar .txt',
                    action: function ( e, dt, button, config ) {
                        var data = dt.buttons.exportData();

                        $.fn.dataTable.fileSave(
                                new Blob(  [ JSON.stringify( data ) ]),
                                'Export.txt'
                        );
                    }

                }
            ],
            "language": {
                "emptyTable": "Nenhum registro encontrado",
                "lengthMenu": "Mostrando _MENU_ registros por página",
                "zeroRecords": "Nada foi encontrado - Desculpe!",
                "info": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "infoEmpty": "Sem registros",
                "infoFiltered": "(filtrados de um total de _MAX_ registros)",
                "loadingRecords": "Carregando...",
                "processing": "Processando...",
                "zeroRecords": "Nenhum registro encontrado",
                "search": "Pesquisar",
                "paginate": {
                    "sNext": "Próximo",
                    "sPrevious": "Anterior",
                    "sFirst": "Primeiro",
                    "sLast": "Último"
                }
            },
            "order": [[ 3, "asc" ]],
            "processing": true,
            "ajax": "<c:url value="/ajax/animal.action"/>",
            "columnDefs": [
                {
                    "targets": [ 0 ],
                    "visible": false,
                    "searchable": false
                },
                {
                    "targets": -1,
                    "data": null,
                    "render": function(data, type, full) {
                        return '<a onclick="edit({id:\''+ full[0] +'\', nome:\''+ full[3] +'\'});" class="btnEdit btn btn-sm btn-warning dim m-t-n-xs" data-toggle="tooltip" data-placement="top" title="Editar"><i class="fa fa-pencil-square-o"></i></a>&nbsp;' +
                                '<a id="btnRemove" onclick="remover({id:\''+ full[0] +'\', nome:\''+ full[3] +'\'});" class="btn btn-sm btn-danger dim m-t-n-xs" data-toggle="tooltip" data-placement="top" title="Excluir"><i class="fa fa-trash-o"></i></a>';
                    },
                    "width": "15%"
                }
            ]
        });
    });

    function getOrdens(opts) {

        var idClasse = $('#classe').val();
        if (idClasse) {

            $.ajax({
                type: "GET",
                data: {idClasse: idClasse},
                url: opts.urlGetOrdens,
                success: function( retorno ){
                    if ( retorno.success ){
                        populaOrdens(retorno.filteredordens, opts.idClasse);
                    } else {
                        toastr.options.closeButton = true;
                        toastr.error(retorno.message);
                    }
                },
                error: function( retorno ){
                    var json = eval('('+ retorno.responseText +')')
                    if (json.message) {
                        toastr.options.closeButton = true;
                        toastr.error(json.message);
                    }
                }
            })
        } else {
            ordemDefault();

        }
    }

    function populaOrdens(ordens, idClasse){
        if (ordens != null && ordens.length > 0) {
            $('#ordem').html('<option value="">---Selecione---</option>');
            $(ordens).each(function(index, ordem) {
                $('#ordem').append('<option value="'+ ordem.idOrdem + '">' + ordem.descricao + '</option>');
            });
        } else {
            $('#ordem').html('<option value="">---Nenhuma ordem encontrada---</option>');
        }
    }

    function ordemDefault() {
        $('#ordem').html('<option value="">---Selecione primeiramente uma classe---</option>');
    }




    function edit(opts) {

        if (opts.id == null) {
            toastr.options = {
                closeButton: true,
                debug: false,
                progressBar: false,
                preventDuplicates: false,
                positionClass: 'toast-top-right',
                onclick: null
            }
            var $toast = toastr.error('Selecione um registro!');

        }
        else {
            $('.btnEdit').attr('href', '<c:url value='/animal/edit.action?id='/>' + opts.id);
        }
    }

    function remover(opts) {

        if (opts.id == null) {
            toastr.options = {
                closeButton: true,
                debug: false,
                progressBar: false,
                preventDuplicates: false,
                positionClass: 'toast-top-right',
                onclick: null
            }
            var $toast = toastr.error('Selecione um registro!');

        }
        else {
            swal({
                        title: "Excluir",
                        text: "Confirma a exclusão do Animal: " + opts.nome + "?",
                        //type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#1ab394",
                        confirmButtonText: "Confirmar",
                        cancelButtonText: "Cancelar",
                        closeOnConfirm: true,
                        closeOnCancel: true },
                    function (isConfirm) {
                        if (isConfirm) {
                            $.ajax({
                                url: '<c:url value='/ajax/animal/delete.action'/>' + '?' + $.param({"id": opts.id}),
                                type: 'GET',
                                success: function(){
                                    console.log("SUCCESS");
                                    table.ajax.reload();
                                    toastr.options.closeButton = true;
                                    toastr.success('Registro excluído com sucesso!');
                                },
                                error: function(){
                                    console.log("ERROR");
                                    toastr.options.closeButton = true;
                                    toastr.error('Não foi possível excluir o registro!');
                                }
                            });
                        }
                    });
        }
    }


    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    });

</script>


</body>
</html>
