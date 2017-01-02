# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
		$('#loads').dataTable( {
    	"order": [ 7, 'asc' ]
		} );
		
jQuery ->
		$('#pilot').dataTable( {
    	"order": [ 7, 'asc' ]
		} );		
		
jQuery ->
		$('#covered').dataTable( {
    	"order": [ 7, 'asc' ]
		} );		
		
jQuery ->
		$('#archived').dataTable( {
    	"order": [ 7, 'asc' ]
		} );
		
jQuery ->
		$('#public').dataTable( {
    	"order": [ 7, 'asc' ]
		} );