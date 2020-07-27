<div class="signup-form">
	<div class="form-title">Customer Profile</div>
	<form action="${pageContext.request.contextPath}/update_profile"
		method="post" class="register-form" id="register-form">
		<div class="form-group">
			<label for="full_name">Full Name :</label> <input type="text"
				name="full_name" value="${customer.fullname}" id="full_name" />
		</div>

		<div class="form-group">
			<label for="email">Email:</label> <input type="email" name="email"
				value="${customer.email}" id="email" readonly/><i>Cannot be changed</i>
		</div>
		<div class="form-group">
			<label for="password">Password :</label> <input type="password"
				name="password" value="${customer.password}" id="password" />
		</div>
		<div class="form-group">
			<label for="re-password">Repeat Password :</label> <input
				type="password" name="re-password" id="re-password"
				value="${customer.password}" oninput="checkItem(this)" />
		</div>

		<div class="form-group">
			<label for="phone">Phone Number :</label> <input type="text"
				name="phone" value="${customer.phone}" id="phone" />
		</div>
		<div class="form-group">
			<label for="address">Address :</label> <input type="text"
				name="address" value="${customer.address}" id="address" />
		</div>
		<div class="form-group">
			<label for="city">City :</label> <input type="text" name="city"
				value="${customer.city}" id="city" required />
		</div>
		<div class="form-group">
			<label for="zip_code">Zip Code :</label> <input type="text"
				name="zip_code" value="${customer.zipcode}" id="zip_code" />
		</div>
		<div class="form-group">
			<label for="country">Country :</label> <input type="text"
				name="country" value="${customer.country}" id="country" />
		</div>
		<div class="form-submit">
			<input type="submit" value="Cancel" class="submit" name="reset"
				id="reset" /> 
			<input type="submit" value="Save" class="submit"
				name="submit" id="submit" onClick="history.go(-1)" />
		</div>
	</form>
</div>