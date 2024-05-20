/**
 * 
 */
function validateEmail(email) {
	if (email.length == 0) {
		document.getElementById("email").style.borderColor = "red";
	}
	/*const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	if (!emailRegex.test(email)) {
		document.getElementById("email").style.borderColor = "red";
		return false;
	}
	return true;*/
}
function validatePassword(password) {
	if (password.length == 0) {
		document.getElementById("password").style.borderColor = "red";
	}
}

function validateRepeatPassword(password) {
	if (password.length == 0) {
		document.getElementById("repeatPassword").style.borderColor = "red";
	}
}
function changeEmailBorderColor() {
	document.getElementById("email").style.borderColor = "black";
}

function changePasswordBorderColor() {
	document.getElementById("password").style.borderColor = "black";
}

function changeRepeatPasswordBorderColor() {
	document.getElementById("repeatPassword").style.borderColor = "black";
}

function registerUser(event) {
	var email = document.getElementById("email").value.trimStart();
	var password = document.getElementById("password").value.trimStart();
	var repeatPassword = document.getElementById("repeatPassword").value.trimStart();
	if (email.length == 0 || password.length == 0 || repeatPassword.length == 0) {
		validateEmail(email);
		validatePassword(password);
		validateRepeatPassword(repeatPassword);
		event.preventDefault();
	}
	else {
		document.getElementById("form-register-user").submit();
	}
}

function validateContactName(contactName) {
	if (contactName.length == 0) {
		document.getElementById("contactName").style.borderColor = "red";
	}
}

function validatePhone(phone) {
	const phoneRegex = /^\d{10}$/;
	if (!phoneRegex.test(phone)) {
		document.getElementById("phone").style.borderColor = "red";
		return false;
	}
	return true;
}

function validateCompanyName(companyName) {
	if (companyName.length == 0) {
		document.getElementById("companyName").style.borderColor = "red";
	}
}

function validateAddress(address) {
	if (address.length == 0) {
		document.getElementById("address").style.borderColor = "red";
	}
}

function validateCity(city) {
	if (city.length == 0) {
		document.getElementById("city").style.borderColor = "red";
	}
}

function changeContactNameBorderColor() {
	document.getElementById("contactName").style.borderColor = "black";
}

function changeCompanyNameBorderColor() {
	document.getElementById("companyName").style.borderColor = "black";
}


function changePhoneBorderColor() {
	document.getElementById("phone").style.borderColor = "black";
}

function changeAddressBorderColor() {
	document.getElementById("address").style.borderColor = "black";
}

function changeCityBorderColor() {
	document.getElementById("city").style.borderColor = "black";
}

function registerEmployer(event) {
	var email = document.getElementById("email").value.trimStart();
	var password = document.getElementById("password").value.trimStart();
	var repeatPassword = document.getElementById("repeatPassword").value.trimStart();
	var contactName = document.getElementById("contactName").value.trimStart();
	var phone = document.getElementById("phone").value.trimStart();
	var companyName = document.getElementById("companyName").value.trimStart();
	var address = document.getElementById("address").value.trimStart();
	var city = document.getElementById("city").value.trimStart();
	var validPhone = validatePhone(phone);
	if (!validPhone || email.length == 0 || password.length == 0 || repeatPassword.length == 0 || contactName.length == 0
	|| companyName.length == 0 || address.length == 0 || city.length == 0) {
		validateEmail(email);
		validatePassword(password);
		validateRepeatPassword(repeatPassword);
		validateContactName(contactName);
		validateCompanyName(companyName);
		validateAddress(address);
		validateCity(city);
		event.preventDefault();
	}
	else {
		document.getElementById("form-register-employer").submit();
	}
}

function validateName(name) {
	if (name.length == 0) {
		document.getElementById("name").style.borderColor = "red";
	}
}

function validateSex(sex) {
	if (sex.length == 0) {
		document.getElementById("sex").style.borderColor = "red";
	}
}

function validateDob(dob) {
	if (dob.length == 0) {
		document.getElementById("dob").style.borderColor = "red";
	}
}

function changeNameBorderColor() {
	document.getElementById("name").style.borderColor = "black";
}

function changeSexBorderColor() {
	document.getElementById("sex").style.borderColor = "black";
}

function changeDobBorderColor() {
	document.getElementById("dob").style.borderColor = "black";
}

function validateDobProfile(dob) {
	
	const dobRegex = /^\d{4}-\d{2}-\d{2}$/;
	const dobProfileRegex = /^\d{2}\/\d{2}\/\d{4}$/;
	if (!dobRegex.test(dob) && !dobProfileRegex.test(dob)) {
		document.getElementById("dob").style.borderColor = "red";
		return false;
	}
	return true;
}

function apply(event) {
	var name = document.getElementById("name").value.trimStart();
	var phone = document.getElementById("phone").value.trimStart();
	var sex = document.getElementById("sex").value.trimStart();
	var address = document.getElementById("address").value.trimStart();
	var dob = document.getElementById("dob").value.trimStart();
	var validDobProfile = validateDobProfile(dob);
	var validPhone = validatePhone(phone);
	if (!validDobProfile || !validPhone || name.length == 0 || sex.length == 0 || address.length == 0) {
		validateName(name);
		validateSex(sex);
		validateAddress(address);
		event.preventDefault();
	}
	else {
		document.getElementById("form-apply").submit();
	}
}

function profile(event) {
	var name = document.getElementById("name").value.trimStart();
	var phone = document.getElementById("phone").value.trimStart();
	var sex = document.getElementById("sex").value.trimStart();
	var address = document.getElementById("address").value.trimStart();
	var dob = document.getElementById("dob").value.trimStart();
	var validDobProfile = validateDobProfile(dob);
	var validPhone = validatePhone(phone);
	if (!validDobProfile || !validPhone ||sex.length == 0 || address.length == 0 || name.length == 0) {
		validateName(name);
		validateSex(sex);
		validateAddress(address);
		event.preventDefault();
	}
	else {
		document.getElementById("form-profile").submit();
	}
}

function validateTitle(title) {
	if (title.length == 0) {
		document.getElementById("title").style.borderColor = "red";
	}
}

function validateQuantity(quantity) {
	if (quantity.length == 0) {
		document.getElementById("quantity").style.borderColor = "red";
	}
}

function validateMinSalary(minSalary) {
	if (minSalary.length == 0) {
		document.getElementById("min-salary").style.borderColor = "red";
	}
}

function validateMaxSalary(maxSalary) {
	if (maxSalary.length == 0) {
		document.getElementById("max-salary").style.borderColor = "red";
	}
}

function validateDescription(description) {
	if (description.length == 0) {
		document.getElementById("description").style.borderColor = "red";
	}
}

function validateRequire(require) {
	if (require.length == 0) {
		document.getElementById("require").style.borderColor = "red";
	}
}

function validateInterest(interest) {
	if (interest.length == 0) {
		document.getElementById("interest").style.borderColor = "red";
	}
}

function validateProfession(profession) {
	if (profession.length == 0) {
		document.getElementById("profession").style.borderColor = "red";
	}
}

function validateDueDate(dueDate) {
	if (dueDate.length == 0) {
		document.getElementById("due-date").style.borderColor = "red";
	}
}

function changeTiltleBorderColor() {
	document.getElementById("title").style.borderColor = "black";
}

function changeQuantityBorderColor() {
	document.getElementById("quantity").style.borderColor = "black";
}

function changeMinsalaryBorderColor() {
	document.getElementById("min-salary").style.borderColor = "black";
}

function changeMaxSalaryBorderColor() {
	document.getElementById("max-salary").style.borderColor = "black";
}

function changeDescriptionBorderColor() {
	document.getElementById("description").style.borderColor = "black";
}

function changeRequireBorderColor() {
	document.getElementById("require").style.borderColor = "black";
}

function changeInterestBorderColor() {
	document.getElementById("interest").style.borderColor = "black";
}

function changeProfessionBorderColor() {
	document.getElementById("profession").style.borderColor = "black";
}

function changeDueDateBorderColor() {
	document.getElementById("due-date").style.borderColor = "black";
}

function recruitment(event) {
	var title = document.getElementById("title").value.trimStart();
	var quantity = document.getElementById("quantity").value.trimStart();
	var minSalary = document.getElementById("min-salary").value.trimStart();
	var maxSalary = document.getElementById("max-salary").value.trimStart();
	var description = document.getElementById("description").value.trimStart();
	var require = document.getElementById("require").value.trimStart();
	var interest = document.getElementById("interest").value.trimStart();
	var city = document.getElementById("city").value.trimStart();
	var profession = document.getElementById("profession").value.trimStart();
	var dueDate = document.getElementById("due-date").value.trimStart();
	if (title.length == 0 || quantity.length == 0 || minSalary.length == 0 || maxSalary.length == 0
	|| description.length == 0 || require.length == 0 || interest.length == 0 || city.length == 0
	|| profession.length == 0 || dueDate.length == 0) {
		validateTitle(title);
		validateQuantity(quantity);
		validateMinSalary(minSalary);
		validateMaxSalary(maxSalary);
		validateDescription(description);
		validateRequire(require);
		validateInterest(interest);
		validateCity(city);
		validateProfession(profession);
		validateDueDate(dueDate);
		event.preventDefault();
	}
	else {
		document.getElementById("form-recruitment").submit();
	}
}