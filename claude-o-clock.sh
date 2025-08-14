#!/bin/bash

# This script runs continuously and calls claude at 01 minutes past every hour
# The output is spoken using the say command in Korean

while true; do
    # Get current hour for context
    hour=$(date +%H)
    
    # Prepare motivational prompt based on time of day
    if [ $hour -ge 5 ] && [ $hour -lt 12 ]; then
        prompt="안녕! 지금 $(date +%H)시야. 오늘 하루를 활기차게 시작할 수 있도록 힘이 나는 한마디 해줘!"
    elif [ $hour -ge 12 ] && [ $hour -lt 18 ]; then
        prompt="안녕! 지금 $(date +%H)시야. 오후를 힘차게 보낼 수 있도록 동기부여가 되는 응원 한마디 해줘!"
    elif [ $hour -ge 18 ] && [ $hour -lt 22 ]; then
        prompt="안녕! 지금 $(date +%H)시야. 하루를 마무리하면서 성취감을 느낄 수 있는 격려의 한마디 해줘!"
    else
        prompt="안녕! 지금 $(date +%H)시야. 편안한 휴식과 내일을 위한 따뜻한 한마디 해줘!"
    fi
    
    # Display the prompt
    echo "Asking Claude: $prompt"
    
    # Run claude command and capture output
    response=$(claude -p "$prompt")
    
    # Display the response
    echo "Claude says: $response"
    
    # Speak the response using Korean voice (Yuna)
    say -v Yuna "$response"
    
    # Get current time
    current_hour=$(date +%H)
    current_minute=$(date +%M)
    current_second=$(date +%S)
    
    # Calculate seconds since midnight
    current_total_seconds=$((current_hour * 3600 + current_minute * 60 + current_second))
    
    # Calculate next target time (next hour at 01 minute)
    next_hour=$(((current_hour + 1) % 24))
    target_total_seconds=$((next_hour * 3600 + 60))  # 60 seconds = 1 minute past the hour
    
    # If target is in the next day (past midnight)
    if [ $target_total_seconds -le $current_total_seconds ]; then
        target_total_seconds=$((target_total_seconds + 86400))  # Add 24 hours in seconds
    fi
    
    # Calculate wait time
    wait_seconds=$((target_total_seconds - current_total_seconds))
    
    echo "Waiting $wait_seconds seconds until next run at ${next_hour}:01..."
    sleep $wait_seconds
done