local Class = require('../src/class')

function dump(t)
  print(t, ' stuff:')
  for k, v in pairs(t) do
    print('  ', k, ' = ', v)
  end
end

describe('class', function()
  describe('create', function ()
    local didCtorWork = nil
    local didMemberFuncWork = nil
    local fakeValue = nil
    local base = nil

    before_each(function()
      didCtorWork = false
      didMemberFuncWork = false
      fakeValue = 1
      base = {
        prototype = {}
      }
    end)

    it('IF base class and create function passed THEN returns class instance with proper base class and create function', function()

      local FakeClass = Class:create(base, function(self, value)
        self.memberVar = value
        didCtorWork = true
      end)
      function FakeClass.prototype:memberFunc()
        didMemberFuncWork = true
      end

      assert.are.equal(base, FakeClass.base)
      local i = FakeClass:create(fakeValue)
      assert.truthy(didCtorWork)
      i:memberFunc()
      assert.truthy(didMemberFuncWork)
      assert.are.equal(fakeValue, i.memberVar)
    end)

    it('IF base class passed but no create function passed then returns class instance with proper base class', function()

      local FakeClass = Class:create(base)
      function FakeClass.prototype:memberFunc()
        didMemberFuncWork = true
      end
      FakeClass.prototype.memberVar = fakeValue

      assert.are.equal(base, FakeClass.base)
      local i = FakeClass:create(fakeValue)
      i:memberFunc()
      assert.truthy(didMemberFuncWork)
      assert.are.equal(fakeValue, i.memberVar)
    end)

    it('IF base class not passed but create function passed THEN returns class instance with proper base class and create function', function()

      local FakeClass = Class:create(function(self, value)
        self.memberVar = value
        didCtorWork = true
      end)
      function FakeClass.prototype:memberFunc()
        didMemberFuncWork = true
      end

      local i = FakeClass:create(fakeValue)
      assert.truthy(didCtorWork)
      i:memberFunc()
      assert.truthy(didMemberFuncWork)
      assert.are.equal(fakeValue, i.memberVar)
    end)

    it('IF base class and create function not passed THEN returns class instance with proper base class and create function', function()

      local FakeClass = Class:create()
      function FakeClass.prototype:memberFunc()
        didMemberFuncWork = true
      end
      FakeClass.prototype.memberVar = fakeValue

      local i = FakeClass:create(fakeValue)
      i:memberFunc()
      assert.truthy(didMemberFuncWork)
      assert.are.equal(fakeValue, i.memberVar)
    end)

    -- can call base class using base.FUNC_NAME
  end)
end)
