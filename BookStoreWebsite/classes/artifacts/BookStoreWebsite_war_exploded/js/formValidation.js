/**
 * Validate new user creation form
 */

const userForm = document.getElementById("newForm");
const password = document.getElementById("pwd");
const confirmPassword = document.getElementById("confirm_pwd");
const errorElement = document.getElementById("error-msg");

userForm.addEventListener("submit", (e) => {
	let messages = [];
	
	const passwordVal = password.value.trim();
	const password2Val = confirmPassword.value.trim();
	
	if (passwordVal != password2Val) {
		messages.push("Password not matched!");
	}
	
	if (passwordVal.length <= 8) {
		messages.push("Password must be longer than 8 characters");
	}
	
	if (passwordVal.length > 16) {
		messages.push("Password must be shorter than 16 characters");
	}
	
	if (messages.length > 0) {
		e.preventDefault();
		errorElement.innerText = messages.join(', ');
	} 
})