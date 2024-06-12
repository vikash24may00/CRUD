trigger leadtrigger1udemy on Lead (before insert,before update) 
{
    for(lead l : trigger.new)
    {
        if(string.isblank(l.Rating))
        {
            l.Rating = 'warm';
        }
    }
}