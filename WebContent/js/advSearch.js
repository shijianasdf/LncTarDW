var advSearch;
if (!advSearch) {
	advSearch = {};
}

(function () {
    "use strict";
    var currentId = 0;
    
    function makeInputParams(id) {
   	 return '<span id="multiAttri-search-params_' + id + '"> <input style="width: 218px;height:20px" id="param_' + id + '" type="text"></span>';
    }
    
    function makeGPMSelectParams(id) {
        return '<span id="multiAttri-search-params_' + id + '"> <select style="width: 218px;height:25px;" id="param_' + id + '">' +
        '<option value="RNAi">RNAi</option>' +
        '<option value="overExpression">Over Expression</option>' +
        '<option value="small_molecule_inhibitor">Small Molecule Inhibitor</option>' +
        '<option value="knockout">Knock Out</option>' +
        '<option value="mutated">Mutated</option>' +
        '<option value="mutated">Knockdown</option>' +
        '<option value="deletion">Deletion</option>' +
        '</select> </span>';
     } 
    
    function makeRNATypeSelectParams(id){
    	return '<span id="multiAttri-search-params_' + id + '"> <select style="width: 218px;height:25px" id="param_' + id + '">' +
        '<option value="protein-coding gene">protein-coding gene</option>' +
        '<option value="lncRNA">lncRNA</option>' +
        '<option value="miRNA">miRNA</option>' +
        '</select> </span>';    	
    }
    
    
    function makeMultiAttriFilterRow(id) {
        return '<div id="multifilterrow_' + id + '">' +
            '<select id="multiAttri-search-attr_' + id + '" class="multiAttri-search-attr"> style="height:20px"' +
            '<option value="gene_symbol">Gene Symbol</option>' +
            '<option value="genetic_perturbation_manner">GP Manner</option>' +
            '<option value="gene_type">Gene Type</option>' +
            '<option value="celltype_or_cellline">Cell Type</option>' +
            '</select>' + makeInputParams(id) + '&nbsp;' +
            '<input type="button" style="width: 20px;padding-left:5px;background-color:#FFF" id="addMultiAttriFilterRow_' + id + '" class="addMultiAttriFilterRow" value="+">' +
            '</div><div id="append-MultiAttriFilter-row"></div>';
    }
	
    
    function numPart(id) {
        var comps = id.split('_');
        return comps[comps.length - 1];
    }

    function replaceRow(id, attrType) {
        if (attrType == 'genetic_perturbation_manner') {
            $('#multiAttri-search-params_' + id).replaceWith(makeGPMSelectParams(id));
        }else if(attrType == 'gene_type'){
        	$('#multiAttri-search-params_' + id).replaceWith(makeRNATypeSelectParams(id));
        }else {
            $('#multiAttri-search-params_' + id).replaceWith(makeInputParams(id));
        }
    }
    
    function updateEventHandlers() { 

        // for simplicity, we just replace all the existing event handlers
        // if we don't, the elements will fire more and more events
        $('.multiAttri-search-attr').off('change').on('change', function() {
          replaceRow(numPart($(this).attr('id')), $(this).val());
        });
        $('.addMultiAttriFilterRow').off('click').on('click', function() {
          var id = $(this).attr('id');
          var num = numPart(id);
          // turn the add button in to a remove button
          $('#' + id).replaceWith('<input type="button" style="width: 20px;padding-left:5px" id="remMultiAttriFilterRow_' + num + '" class="remMultiFilterRow" value="-">');
          $('#append-MultiAttriFilter-row').replaceWith(makeMultiAttriFilterRow(currentId++));
          updateEventHandlers();
        });
        $('.remMultiFilterRow').off('click').on('click', function() {
          var id = $(this).attr('id');
          $('#multifilterrow_' + numPart(id)).remove();
        });
    }

    advSearch.example=function(divout){		
		document.getElementById(divout).innerHTML='<div id="gyhSE"><div id="multifilterrow_0"><select id="multiAttri-search-attr_0" class="multiAttri-search-attr"> style="height:20px"<option value="gene_symbol">Gene Symbol</option><option value="genetic_perturbation_manner">GP Manner</option><option value="gene_type">Gene Type</option><option value="celltype_or_cellline">Cell Type</option></select><span id="multiAttri-search-params_0"> <input style="width: 218px;height:20px" id="param_0" value="TP53" type="text"></span>&nbsp;<input type="button" style="width: 20px;padding-left:5px" id="remMultiAttriFilterRow_0" class="remMultiFilterRow" value="-"></div><div id="multifilterrow_1"><select id="multiAttri-search-attr_1" class="multiAttri-search-attr"> style="height:20px"<option value="gene_symbol">Gene Symbol</option><option value="genetic_perturbation_manner">GP Manner</option><option value="gene_type">Gene Type</option><option value="celltype_or_cellline">Cell Type</option></select><span id="multiAttri-search-params_1"> <select style="width: 218px;height:25px;" id="param_1"><option value="RNAi">RNAi</option><option value="overExpression">Over Expression</option><option value="small_molecule_inhibitor">Small Molecule Inhibitor</option><option value="knockout">Knock Out</option><option value="mutated">Mutated</option><option value="mutated">Knockdown</option><option value="deletion">Deletion</option></select> </span>&nbsp;<input type="button" style="width: 20px;padding-left:5px" id="remMultiAttriFilterRow_1" class="remMultiFilterRow" value="-"></div><div id="multifilterrow_6"><select id="multiAttri-search-attr_6" class="multiAttri-search-attr"> style="height:20px"<option value="gene_symbol">Gene Symbol</option><option value="genetic_perturbation_manner">GP Manner</option><option value="gene_type">Gene Type</option><option value="celltype_or_cellline" selected="">Cell Type</option></select><span id="multiAttri-search-params_6"> <select style="width: 218px;height:25px" id="param_6"><option value="protein-coding gene">protein-coding gene</option><option value="lncRNA">lncRNA</option><option value="miRNA">miRNA</option></select> </span>&nbsp;<input type="button" style="width: 20px;padding-left:5px" id="remMultiAttriFilterRow_6" class="remMultiFilterRow" value="-"></div><div id="multifilterrow_7"><select id="multiAttri-search-attr_7" class="multiAttri-search-attr"> style="height:20px"<option value="gene_symbol">Gene Symbol</option><option value="genetic_perturbation_manner">GP Manner</option><option value="gene_type">Gene Type</option><option value="celltype_or_cellline">Cell Type</option></select><span id="multiAttri-search-params_7"> <input style="width: 218px;height:20px" id="param_7" type="text"></span>&nbsp;<input type="button" style="width: 20px;padding-left:5px" id="remMultiAttriFilterRow_7" class="remMultiFilterRow" value="-"></div><div id="multifilterrow_8"><select id="multiAttri-search-attr_8" class="multiAttri-search-attr"> style="height:20px"<option value="gene_symbol">Gene Symbol</option><option value="genetic_perturbation_manner">GP Manner</option><option value="gene_type">Gene Type</option><option value="celltype_or_cellline">Cell Type</option></select><span id="multiAttri-search-params_8"> <input style="width: 218px;height:20px" id="param_8" type="text"></span>&nbsp;<input type="button" style="width: 20px;padding-left:5px;background-color:#FFF" id="addMultiAttriFilterRow_8" class="addMultiAttriFilterRow" value="+"></div><div id="append-MultiAttriFilter-row"></div>',
		updateEventHandlers();
    }; 
    
    advSearch.resetAll=function(divout,formSelector){
    	document.getElementById(divout).innerHTML='<div id="multiAttri-filters">Filter placeholder</div>';
        $(formSelector).replaceWith(makeMultiAttriFilterRow(0));
        updateEventHandlers();  	
    };
    
    
	advSearch.initMultiAttriFilters = function(formSelector, orgcodeSelector,resultsSelector){
        $(formSelector).replaceWith(makeMultiAttriFilterRow(currentId++));
        updateEventHandlers();       
        // Setup the search button event handler
        $('#search-multiAttris').click(function() {         
           var reqData = {
              organism: $(orgcodeSelector).val()
           };
 
           $('.multiAttri-search-attr').each(function (i, elem) {
               var attr = elem.value;//parameter name
               var id   = elem.id;
               var num  = numPart(elem.id); 
               if (reqData.hasOwnProperty(attr) && $('#param_' + num).val()!="") {            	   
                   reqData[attr] =reqData[attr]+","+$('#param_' + num).val();
               } else if($('#param_' + num).val()!=""){
                   reqData[attr] = $('#param_' + num).val();
               }
           });
  

           // search in AdvSearch
           $.ajax({
             url: "AdvMultiSearchAction",
             type: "POST",
             data: reqData,
             dataType: "json",
             error: function(xhr, status, errorThrown) {
                 console.debug("error here: " + errorThrown);
             },
             success: function(data) {
            	 //   
            	 data='<div id="results" style="width:100%;padding-top:10px">'+data+'</div>';
                 $(resultsSelector).replaceWith(data);
             }
           });
        });		
    };


}());

