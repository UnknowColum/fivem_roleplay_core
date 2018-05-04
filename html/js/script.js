var moneyactuelle = 0;
var dirtymoneyactuelle = 0;
var bankbalanceactuelle = 0;

$(function(){

    window.addEventListener("message", function(event) {
		var mess = event.data;


		if(typeof mess.initialise !== 'undefined'){
			$('#money').html('💵' + mess.money + ' <a style="color:#3fff41">$</a>');
			$('#dirtymoney').html('💴' + mess.dirtymoney + ' <a style="color:#b90000">$</a>');
			$('#bankbalance').html('💳' + mess.bankbalance + ' <a style="color:#3fff41">$</a>');
			moneyactuelle = mess.money;
			dirtymoneyactuelle = mess.dirtymoneyinfo;
			bankbalanceactuelle = mess.bankbalanceinfo;
		}

		if(typeof mess.moneyinfo !== 'undefined'){
			$('#money').html('💵' + mess.moneyinfo + ' <a style="color:#3fff41">$</a>');
			moneyactuelle = mess.moneyinfo;
		}

		if(typeof mess.dirtymoneyinfo !== 'undefined'){
			$('#dirtymoney').html('💴' + mess.dirtymoneyinfo + ' <a style="color:#b90000">$</a>');
			dirtymoneyactuelle = mess.dirtymoneyinfo;
		}

		if(typeof mess.bankbalanceinfo !== 'undefined'){
			$('#bankbalance').html('💳' + mess.bankbalanceinfo + ' <a style="color:#b90000">$</a>');
			bankbalanceactuelle = mess.bankbalanceinfo;
		}

		if(typeof mess.rmvBankForMoney !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle - mess.rmvBankForMoney);
			moneyactuelle = Math.round(moneyactuelle + mess.rmvBankForMoney);
			$('#bankbalance').html('💳' + bankbalanceactuelle + ' <a style="color:#3fff41">$</a>');
			$('#money').html('💵' + moneyactuelle + ' <a style="color:#3fff41">$</a>');
		}

		if(typeof mess.rmvMoneyForBank !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle + mess.rmvMoneyForBank);
			moneyactuelle = Math.round(moneyactuelle - mess.rmvMoneyForBank);
			$('#bankbalance').html('💳' + bankbalanceactuelle + ' <a style="color:#3fff41">$</a>');
			$('#money').html('💵' + moneyactuelle + ' <a style="color:#3fff41">$</a>');
		}

		if(typeof mess.addBank !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle + mess.addBank);
			$('#bankbalance').html('💳' + bankbalanceactuelle + ' <a style="color:#3fff41">$</a>');
		}

		if(typeof mess.rmvBank !== 'undefined'){
			bankbalanceactuelle = Math.round(bankbalanceactuelle - mess.rmvBank);
			$('#bankbalance').html('💳' + bankbalanceactuelle + ' <a style="color:#3fff41">$</a>');
		}

		if(typeof mess.addDirtyMoney !== 'undefined'){
			dirtymoneyactuelle = Math.round(dirtymoneyactuelle + mess.addDirtyMoney);
			$('#dirtymoney').html('💴' + dirtymoneyactuelle + ' <a style="color:#b90000">$</a>');
		}

		if(typeof mess.rmvDirtyMoney !== 'undefined'){
			dirtymoneyactuelle = Math.round(dirtymoneyactuelle - mess.rmvDirtyMoney);
			$('#dirtymoney').html('💴' + dirtymoneyactuelle + ' <a style="color:#b90000">$</a>');
		}

		if(typeof mess.addMoney !== 'undefined'){
			$('#addMoney').html('+' + mess.addMoney);
			var newMoney = Math.round(moneyactuelle + mess.addMoney);
			moneyactuelle = newMoney;
			$('#money').html('💵' + newMoney + ' <a style="color:#3fff41">$</a>');
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
			$('#money').html('💵' + newMoney + ' $');
			$("#rmvMoney").fadeIn( "slow", function() {
				setTimeout(function(){
					$("#rmvMoney").fadeOut("slow", function() {
					});
				}, 2000);
  			});
		}
    });

});