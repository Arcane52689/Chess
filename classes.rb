class Employee
  attr_accessor :name, :salary, :title, :boss

  def initialize(name, salary, title, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.employees << self unless boss.nil?
  end

  def bonus(multiplier)

    salary * multiplier
  end

end


class Manager<Employee
  attr_reader :employees

  def initialize(name,title,salary, boss = nil)
    super
    @employees = []
  end


  def bonus(multiplier)
    total_subordinates_salary * multiplier
  end

  def total_subordinates_salary
    total = 0
    employees.each do |employee|
      total += employee.total_subordinates_salary if employee.is_a?(Manager)
      total += employee.salary
    end

    total
  end

end


ned = Manager.new("ned", 1000000, "Founder")
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna",12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
