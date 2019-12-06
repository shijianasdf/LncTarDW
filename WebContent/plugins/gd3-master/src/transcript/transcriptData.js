function transcriptData(data) {
  function parseCancer(cdata) {
    var defaultInactivatingMutations = {
          "Nonsense_Mutation": true,
          "Frame_Shift_Del": true,
          "Frame_Shift_Ins":true,
          "Missense_Mutation": false,
          "Splice_Site": true,
          "In_Frame_Del": false,
          "In_Frame_Ins": false
        };
    var defaultMutationTypesToSymbols = {
          "Nonsense_Mutation": 0,
          "Frame_Shift_Del": 1,
          "Frame_Shift_Ins": 1,
          "Missense_Mutation": 2,
          "Splice_Site": 3,
          "In_Frame_Del": 4,
          "In_Frame_Ins": 4
        };

    // Select the initial protein domain db, going with the first one
    // if it's not provided. Then add the protein domain dbs to each of the domains
    // so we can easily toggle through the different databases 
    var proteinDomainDB = cdata.proteinDomainDB || Object.keys(cdata.domains)[0] || '';
    var domains = [];
    Object.keys(cdata.domains).forEach(function(db){
      cdata.domains[db].forEach(function(d){
        d.db = db;
        domains.push(d);
      });
    });

    var d = {
      geneName: cdata.gene,
      sequence: cdata.protein_sequence || null,
      sequence_annotations: cdata.sequence_annotations || [],
      inactivatingMutations: cdata.inactivatingMutations || defaultInactivatingMutations,
      length: cdata.length,
      mutationCategories: cdata.mutationCategories || [],
      mutations: cdata.mutations,
      mutationTypesToSymbols: cdata.mutationTypesToSymbols || defaultMutationTypesToSymbols,
      proteinDomainDB: proteinDomainDB,
      proteinDomains: domains || []
    };
    d.types = Object.keys(d.mutationTypesToSymbols);
    d.datasets = d3.set(cdata.mutations.map(function(m) { return m.dataset; })).values();
    d.locusToAnnotations = {};
    var seq_annotation_types = d3.set();
    d.sequence_annotations.forEach(function(anno){
      d.locusToAnnotations[anno.locus] = anno.annotation;
      seq_annotation_types.add(anno.annotation);
    });
    d.seq_annotation_types = seq_annotation_types.values().sort();

    // for (var mutation in d.mutations) {
    //   var m = d.mutations[mutation];

    //   // create simulated annotation data if it does not exist.
    //   if (m.annotation == undefined) {
    //     var vote = {
    //       type: 'vote',
    //       score: 100
    //     }
    //     var link = {
    //       type: 'link',
    //       href: 'http://www.cs.brown.edu',
    //       text: 'BrownCS'
    //     }
    //     m.annotation = [
    //       {
    //         type: 'text',
    //         title: 'Sample',
    //         text: m.sample
    //       },
    //       {
    //         type: 'table',
    //         header: ['Cancer', 'PMIDs', 'Votes'],
    //         data: [
    //           ['1', link, vote],
    //           ['4', link, vote]
    //         ]
    //       }
    //     ];
    //   } // end simulated m.annotation
    //   else {
    //     console.log('defined annotation');
    //   }
    // }

    d.get = function(str) {
      if (str == 'length') return d.length;
      else if (str == 'datasets') return d.datasets;
      else if (str == 'mutations') return d.mutations;
      else if (str == 'mutationTypesToSymbols') return d.mutationTypesToSymbols;
      else if (str == 'proteinDomains') return d.proteinDomains;
      else if (str == 'sequence') return d.sequence;
      else return null;
    }
    d.isMutationInactivating = function(mut) {
      return d.inactivatingMutations[mut];
    }
    // Find the first domain that includes the given locus
    d.domain = function(locus){
      var loc = locus * 1; // convert to integer
      for (var i = 0; i < d.proteinDomains.length; i++){
        if (d.proteinDomains[i].start < loc && d.proteinDomains[i].end > loc){
          return d.proteinDomains[i].name;
        }
      }
      return null;
    }

    return d;
  }
  var tData = parseCancer(data);

  return tData;
}
