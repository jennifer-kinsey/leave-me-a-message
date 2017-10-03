// $(function(){
//   $("#favoriteToggler").click(function() {
//     // $(this).find('i').toggle();
//     alert("hi");
//   });​
// });


$( document ).ready(function() {
  $(".favoriteToggler").click(function() {
    $(this).find(".fave").toggle();
  });
});
