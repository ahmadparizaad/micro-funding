module startups_micro_funding::StartupsMicroFunding {
    use aptos_framework::signer;

    /// Struct representing a startup.
    struct Startup has store, key {
        funding_goal: u64,
        funds_raised: u64,
    }

    /// Function to create a new startup with a funding goal.
    public fun create_startup(owner: &signer, goal: u64) {
        let startup = Startup { 
            funding_goal: goal,
            funds_raised: 0
         };
        move_to(owner, startup);
    }

    /// Function for users to contribute to the startup by investing tokens.
    public fun invest_in_startup(owner: address, amount: u64) acquires Startup {
        let startup = borrow_global_mut<Startup>(owner);

        // Update funds raised
        startup.funds_raised = startup.funds_raised + amount;
    }
}
