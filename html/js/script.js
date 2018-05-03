var moneyactuelle = 0;
var dirtymoneyactuelle = 0;
var bankbalanceactuelle = 0;

$(function(){

    window.addEventListener("message", function(event) {
		var mess = event.data;


		if(typeof mess.initialise !== 'undefined'){
			$('#money').html('<img id="icon" src="icons/argent.png" alt=""/>' + mess.money + ' $');
			$('#dirtymoney').html('<img id="icon" src="icons/argent_sale.png" alt=""/>' + mess.dirtymoney + ' $');
			$('#bankbalance').html('<img id="icon" src="icons/banque.png" alt=""/>' + mess.bankbalance + ' $');
			moneyactuelle = mess.money;
			dirtymoneyactuelle = mess.dirtymoneyinfo;
			bankbalanceactuelle = mess.bankbalanceinfo;
		}

		if(typeof mess.moneyinfo !== 'undefined'){
			$('#money').html('<img id="icon" src="icons/argent.png" alt=""/>' + mess.moneyinfo + ' $');
			moneyactuelle = mess.moneyinfo;
		}

		if(typeof mess.dirtymoneyinfo !== 'undefined'){
			$('#dirtymoney').html('<img id="icon" src="icons/argent_sale.png" alt=""/>' + mess.dirtymoneyinfo + ' $');
			dirtymoneyactuelle = mess.dirtymoneyinfo;
		}

		if(typeof mess.bankbalanceinfo !== 'undefined'){
			$('#bankbalance').html('<img id="icon" src="icons/banque.png" alt=""/>' + mess.bankbalanceinfo + ' $');
			bankbalanceactuelle = mess.bankbalanceinfo;
		}

		if(typeof mess.rmvBankForMoney !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle - mess.rmvBankForMoney);
			moneyactuelle = Math.round(moneyactuelle + mess.rmvBankForMoney);
			$('#bankbalance').html('<img id="icon" src="icons/banque.png" alt=""/>' + bankbalanceactuelle + ' $');
			$('#money').html('<img id="icon" src="icons/argent.png" alt=""/>' + moneyactuelle + ' $');
		}

		if(typeof mess.rmvMoneyForBank !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle + mess.rmvMoneyForBank);
			moneyactuelle = Math.round(moneyactuelle - mess.rmvMoneyForBank);
			$('#bankbalance').html('<img id="icon" src="icons/banque.png" alt=""/>' + bankbalanceactuelle + ' $');
			$('#money').html('<img id="icon" src="icons/argent.png" alt=""/>' + moneyactuelle + ' $');
		}

		if(typeof mess.addBank !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle + mess.addBank);
			$('#bankbalance').html('<img id="icon" src="icons/banque.png" alt=""/>' + bankbalanceactuelle + ' $');
		}

		if(typeof mess.rmvBank !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle - mess.rmvBank);
			$('#bankbalance').html('<img id="icon" src="icons/banque.png" alt=""/>' + bankbalanceactuelle + ' $');
		}

		if(typeof mess.addDirtyMoney !== 'undefined'){
			dirtymoneyactuelle = Math.round(dirtymoneyactuelle + mess.addDirtyMoney);
			$('#dirtymoney').html('<img id="icon" src="icons/argent_sale.png" alt=""/>' + dirtymoneyactuelle + ' $');
		}

		if(typeof mess.rmvDirtyMoney !== 'undefined'){
			dirtymoneyactuelle = Math.round(dirtymoneyactuelle - mess.rmvDirtyMoney);
			$('#dirtymoney').html('<img id="icon" src="icons/argent_sale.png" alt=""/>' + dirtymoneyactuelle + ' $');
		}

		if(typeof mess.addMoney !== 'undefined'){
			$('#addMoney').html('+' + mess.addMoney);
			var newMoney = Math.round(moneyactuelle + mess.addMoney);
			moneyactuelle = newMoney;
			$('#money').html('<img id="icon" src="icons/argent.png" alt=""/>' + newMoney + ' $');
			$("#addMoney").fadeIn("slow", function(){
				setTimeout(function(){ 
					$("#addMoney").fadeOut( "slow", function() {
					});
				}, 2000);
  			});
		}

		if(typeof mess.rmvMoney !== 'undefined'){
			$('#rmvMoney').html('-' + mess.rmvMoney);
			var newMoney = Math.round(moneyactuelle - mess.rmvMoney);
			moneyactuelle = newMoney;
			$('#money').html('<img id="icon" src="icons/argent.png" alt=""/>' + newMoney + ' $');
			$("#rmvMoney").fadeIn( "slow", function() {
				setTimeout(function(){
					$("#rmvMoney").fadeOut("slow", function() {
					});
				}, 2000);
  			});
		}
    });

});