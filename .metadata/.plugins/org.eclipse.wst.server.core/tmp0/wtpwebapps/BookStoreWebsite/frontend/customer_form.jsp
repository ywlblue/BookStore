<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="form-group">
			<label for="first_name">First Name :</label> <input type="text"
				name="first_name" value="${customer.firstname}" id="first_name" />
		</div>
		<div class="form-group">
			<label for="last_name">Last Name :</label> <input type="text"
				name="last_name" value="${customer.lastname}" id="last_name" />
		</div>

		<div class="form-group">
			<label for="email">Email:</label> <input type="email" name="email"
				value="${customer.email}" id="email" readonly /><i>Cannot be
				changed</i>
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
			<label for="addressLine1">Address Line1:</label> <input type="text"
				name="addressLine1" value="${customer.addressLine1}" id="addressLine1" />
		</div>
		<div class="form-group">
			<label for="addressLine2">Address Line1:</label> <input type="text"
				name="addressLine2" value="${customer.addressLine2}" id="addressLine2" />
		</div>
		<div class="form-group">
			<label for="city">City :</label> <input type="text" name="city"
				value="${customer.city}" id="city" required />
		</div>
		<div class="form-group">
			<label for="state">State :</label> <input type="text" name="state"
				value="${customer.state}" id="state" required />
		</div>
		<div class="form-group">
			<label for="zip_code">Zip Code :</label> <input type="text"
				name="zip_code" value="${customer.zipcode}" id="zip_code" />
		</div>
		<div class="form-group">
			<label for="country">Country :</label> <select name="country"
				id="country" class="common-text">
				<c:forEach var="country" items="${mapCountries}">
					<option value="${country.value}" <c:if test="${customer.country eq country.value}">selected="selected"</c:if>>${country.key}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-submit">
			<input type="submit" value="Cancel" class="submit" name="reset"
				id="reset"  onClick="history.go(-1)" /> 
			<input type="submit" value="Save" class="submit"
				name="submit" id="submit"/>
		</div>