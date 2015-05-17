<h1>Employee Reviews</h1>
<h5>Employee Reviews allows for the creation of an Employee Object and a Department Object, which stores Employee Objects within it.  These objects can be given raises per employee or per department and can then divide up raises according to the characteristics that a user defines in a block</h5>

<h5>This program was developed with an employee_reviews_test file using TDD</h5>

<h1>Employee Object</h1>
<p>The Employee class is initialized with the following characteristics of an employee:</p>
<ul>
<li><strong>Name</strong></li>
<li><strong>Email Address</strong> (validated upon initialization)</li>
<li><strong>Phone Number</strong> (validated upon initialization)</li>
<li><strong>Salary</strong> (passed in as a float or integer value)</li>
</ul>
<h3>class methods for this object include: </h3>
<ul>
<li><h3>add_review</h3><p>Takes in a string of review text and stores it in an instance variable.</p></li>
<li><h3>positive_review</h3><p>Takes a boolean as an argument to determine whether or not the employee review is positive or negative.</p></li>
<li><h3>give_raise</h3><p>Takes in a raise amount and adds it to the employee salary if the employee's review was positive.</p></li>
<li><h3>give_raise_without_restriction</h3><p>Gives raise to employee without taking into account review status.</p></li>
<li><h3>parse_review</h3>Takes the text obtained from add_review method and iterates over regular expressions to determine whether or not the review was a positive review or a negative review.</p></li>
</ul>

<h1>Department Object</h1>
<p>The Department class is initialized with a department name only, which is stored in the instance variable name.</p>

<h3>class methods for this object include:</h3>

<ul>
<li><h3>add_employee</h3><p>Takes in an employee object and adds it to instance variable employees</p></li>
<li><h3>give_raise</h3><p>Takes a float or integer as argument and iterates over the employees, sorting which employees are eligible for a raise.  After it determines this, it divides the raise up by the number eligible and adds it to the total.  This method can also be passed a block, which will ignore the employee review and give raises based on a condition assigned in the block.</p></li>

</ul>
