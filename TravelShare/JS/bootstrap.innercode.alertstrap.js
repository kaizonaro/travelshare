﻿$(document).ready(function () { systemAlert = window.alert, window.alert = function (t, d) { "undefined" == typeof d && (d = window.location.hostname), $("body").append("<div class='modal fade' id='ICBSalertmodal' role='dialog'><div class='modal-dialog'><div class='modal-content'><div class='modal-header'><button type='button' class='close' data-dismiss='modal'>&times;</button><h4 class='modal-title' id='ICBSalertmodal_title'></h4></div><div class='modal-body'><p id='ICBSalertmodal_text'></p></div><div class='modal-footer'><button type='button' class='btn btn-default' data-dismiss='modal'>OK</button></div></div></div></div>"), $("#ICBSalertmodal").on("hidden.bs.modal", function (t) { $("#ICBSalertmodal").remove() }), $("#ICBSalertmodal_title").text(d), $("#ICBSalertmodal_text").html(t.split("\n").join("<br>")), "function" == typeof $("#ICBSalertmodal").modal ? $("#ICBSalertmodal").modal() : systemAlert(t) } });