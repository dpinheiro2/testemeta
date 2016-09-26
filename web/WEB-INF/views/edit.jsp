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

    <title>Teste Meta | Edição Animais</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Font-Awesome -->
    <link href="<c:url value="/assets/font-awesome/css/font-awesome.css"/>" rel="stylesheet">

    <!-- Animação CSS -->
    <link href="<c:url value="/assets/css/animate.css"/>" rel="stylesheet">

    <!-- Sweet Alert -->
    <link href="<c:url value="/assets/css/plugins/sweetalert/sweetalert.css"/>" rel="stylesheet">

    <!-- Toastr style -->
    <link href="<c:url value="/assets/css/plugins/toastr/toastr.min.css"/>" rel="stylesheet">

    <!--Sky Forms Pro -->
    <link href="<c:url value="/assets/css/plugins/sky-forms-pro/skyforms/css/sky-forms.css"/>" rel="stylesheet">
    <!--[if lt IE 9]><link rel="stylesheet" href="assets/css/plugins/sky-forms-pro/skyforms/css/sky-forms-ie8.css"><![endif]-->

    <!-- Custom styles -->
    <link href="<c:url value="/assets/css/style.css"/>" rel="stylesheet">

    <link href="<c:url value="/assets/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/css/plugins/iCheck/custom.css"/>" rel="stylesheet">
</head>
<body class="pace-done skin-1">

<div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-rounded" src="<c:url value="/assets/img/logo.jpg"/>" />
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
                <h2>Edição Animal</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="#">Home</a>
                    </li>
                    <li>
                        <a>Animais</a>
                    </li>
                    <li class="active">
                        <strong>Ediçao Animal</strong>
                    </li>
                </ol>
            </div>
            <div class="col-sm-8">
                <div class="title-action">

                </div>
            </div>
        </div>




        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>Edição Animais</h5>
                            <div class="ibox-tools">

                            </div>
                        </div>
                        <div class="ibox-content">


                            <c:url var="action" value="/animal/update.action"/>
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
                                                <c:choose>
                                                    <c:when test="${animal.ordem.classe.idClasse == c.idClasse}">
                                                        <option selected="selected" value="${c.idClasse}" label="${c.descricao}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${c.idClasse}" label="${c.descricao}"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </select>
                                    </label>
                                </div>

                                <div class="form-group">
                                    <label>Ordem *</label>
                                    <label class="input">
                                        <form:select path="ordem" class="form-control m-b">
                                            <form:option selected="selected" value="${animal.ordem.idOrdem}">${animal.ordem.descricao}</form:option>
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
                                            <c:forEach var="h" items="${habitats}">
                                                <c:choose>
                                                    <c:when test="${animal.habitat.idHabitat == h.idHabitat}">
                                                        <form:option selected="selected" value="${h.idHabitat}" label="${h.descricao}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <form:option value="$h.idHabitat}" label="${h.descricao}"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </form:select>
                                    </label>
                                </div>

                                <div class="form-group">
                                    <label class="checkbox-inline i-checks">
                                        <c:choose>
                                            <c:when test="${animal.indAmeacado == 1}">
                                                <input type="checkbox" id="indAmeacado" name="indAmeacado" value="1" checked> <strong>Ameaçado Extinção</strong>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="checkbox" id="indAmeacado" name="indAmeacado" value="1"> <strong>Ameaçado Extinção</strong>
                                            </c:otherwise>
                                        </c:choose>
                                    </label>
                                </div>

                            </div>

                            <div class="modal-footer">
                                <button type="reset" onclick="javascript:history.go(-1)" id="cancelForm" class="btn btn-white" >Cancelar</button>
                                <button type="submit" class="btn btn-success">Salvar</button>
                            </div>
                        </div>
                        </form:form>


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
<script src="<c:url value="/assets/js/jquery-2.1.1.js"/>"></script>
<script src="<c:url value="/assets/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/assets/js/plugins/metisMenu/jquery.metisMenu.js"/>"></script>
<script src="<c:url value="/assets/js/plugins/slimscroll/jquery.slimscroll.min.js"/>"></script>

<!-- Custom and plugin javascript -->
<script src="<c:url value="/assets/js/inspinia.js"/>"></script>
<script src="<c:url value="/assets/js/plugins/pace/pace.min.js"/>"></script>

<!--Sky Forms Pro -->
<script src="<c:url value="/assets/css/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"/>"></script>

<!-- Sweet alert -->
<script src="<c:url value="/assets/js/plugins/sweetalert/sweetalert.min.js"/>"></script>

<!-- Toastr script -->
<script src="<c:url value="/assets/js/plugins/toastr/toastr.min.js"/>"></script>


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
<script src="<c:url value="/assets/js/plugins/iCheck/icheck.min.js"/>"></script>
<script>

    $(document).ready(function(){

        Validation.initValidation();


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


    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green'
    });

</script>


</body>
</html>

