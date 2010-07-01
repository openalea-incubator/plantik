def CheckVariables(valid_variables, user_variables=None):
    
    # if no options provided, returns valid
    if user_variables == None:
        return valid_variables
    else:
        # if user is astring,check its validity
        if type(user_variables)==str:
            if user_variables in valid_variables:
                return [user_variables]
        # else it must be a list ovalid strings
        elif type(user_variables)!=list:
            raise TypeError('variables must be a list of strings or a strings')
        
        else:
            for variable in user_variables:
                if variable not in valid_variables:
                      raise ValueError('variables must be %s', valid_variables)
            #if we reach this point, all user variable are valid
            return user_variables