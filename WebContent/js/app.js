let itemName = document.querySelector('#itemName');
let menuItem = document.querySelectorAll('.menuItem');
let modalBg =  document.querySelector('.modal-bg');
let closeButton = document.querySelector('.closeButton');
let cartButton = document.querySelector('.cartButton');


for(const item of menuItem){
	item.addEventListener('click', function(event){
		modalBg.classList.add('bg-active');
		document.querySelector('#itemName').innerHTML = item.id;
		document.querySelector('#itemPrice').innerHTML = item.querySelector('.itemPrice').innerHTML;
		document.querySelector('#modalImage').src = item.querySelector('.itemPicture').src;

	});
}

closeButton.addEventListener('click', function(){
	modalBg.classList.remove('bg-active');	
});


cartButton.addEventListener('click', function(event){


	 $.ajax({
    url: 'ProcessCart',
    type: 'POST',        
    data: {name: itemName.innerHTML, operation : "add"},
    success: function(data) {
        console.log('Success');
		location.reload();
    }
});

	modalBg.classList.remove('bg-active');	
});