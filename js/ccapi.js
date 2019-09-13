function intervalometer(numberOfShots, wait, delay){

	setInterval(tripTheShutter, wait);

	console.log(wait);

}

function tripTheShutter(){

	console.log("Shutter Tripped");
}