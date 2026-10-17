.class public abstract Lr52;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lbv1;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lbv1;

    .line 2
    .line 3
    sget-object v1, Lgn1;->a:Lhn1;

    .line 4
    .line 5
    check-cast v1, Lln1;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget-object v1, Lpn1;->o:Ljava/util/concurrent/atomic/AtomicReference;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const-string v3, "Phlogger"

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lrn1;

    .line 25
    .line 26
    iget-object v2, v1, Lrn1;->a:Ljava/util/logging/Level;

    .line 27
    .line 28
    iget-object v4, v1, Lrn1;->b:Ljava/util/Set;

    .line 29
    .line 30
    iget-object v1, v1, Lrn1;->c:Lif2;

    .line 31
    .line 32
    new-instance v5, Ltn1;

    .line 33
    .line 34
    invoke-direct {v5, v3, v2, v4, v1}, Ltn1;-><init>(Ljava/lang/String;Ljava/util/logging/Level;Ljava/util/Set;Lif2;)V

    .line 35
    .line 36
    .line 37
    goto/16 :goto_5

    .line 38
    .line 39
    :cond_0
    new-instance v5, Lpn1;

    .line 40
    .line 41
    const/4 v2, 0x7

    .line 42
    :goto_0
    if-ltz v2, :cond_2

    .line 43
    .line 44
    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    const/16 v6, 0x2e

    .line 49
    .line 50
    const/16 v7, 0x24

    .line 51
    .line 52
    if-ne v4, v7, :cond_1

    .line 53
    .line 54
    invoke-virtual {v3, v7, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    if-eq v4, v6, :cond_2

    .line 60
    .line 61
    add-int/lit8 v2, v2, -0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    :goto_1
    invoke-direct {v5, v3}, Let;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sget-boolean v2, Lpn1;->l:Z

    .line 68
    .line 69
    if-nez v2, :cond_5

    .line 70
    .line 71
    sget-boolean v2, Lpn1;->m:Z

    .line 72
    .line 73
    if-eqz v2, :cond_3

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    sget-boolean v2, Lpn1;->n:Z

    .line 77
    .line 78
    if-eqz v2, :cond_4

    .line 79
    .line 80
    sget-object v2, Ltn1;->q:Lrn1;

    .line 81
    .line 82
    iget-object v4, v2, Lrn1;->b:Ljava/util/Set;

    .line 83
    .line 84
    iget-object v2, v2, Lrn1;->c:Lif2;

    .line 85
    .line 86
    sget-object v6, Ljava/util/logging/Level;->OFF:Ljava/util/logging/Level;

    .line 87
    .line 88
    new-instance v7, Ltn1;

    .line 89
    .line 90
    invoke-direct {v7, v3, v6, v4, v2}, Ltn1;-><init>(Ljava/lang/String;Ljava/util/logging/Level;Ljava/util/Set;Lif2;)V

    .line 91
    .line 92
    .line 93
    iput-object v7, v5, Lpn1;->k:Let;

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_4
    const/4 v2, 0x0

    .line 97
    iput-object v2, v5, Lpn1;->k:Let;

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :cond_5
    :goto_2
    new-instance v2, Lsn1;

    .line 101
    .line 102
    invoke-direct {v2, v3}, Lsn1;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iput-object v2, v5, Lpn1;->k:Let;

    .line 106
    .line 107
    :goto_3
    sget-object v2, Lnn1;->a:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 108
    .line 109
    invoke-virtual {v2, v5}, Ljava/util/concurrent/ConcurrentLinkedQueue;->offer(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    if-eqz v3, :cond_7

    .line 117
    .line 118
    :goto_4
    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    check-cast v3, Lpn1;

    .line 123
    .line 124
    if-eqz v3, :cond_6

    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    check-cast v4, Lrn1;

    .line 131
    .line 132
    iget-object v6, v3, Let;->j:Ljava/lang/Object;

    .line 133
    .line 134
    check-cast v6, Ljava/lang/String;

    .line 135
    .line 136
    iget-object v7, v4, Lrn1;->a:Ljava/util/logging/Level;

    .line 137
    .line 138
    iget-object v8, v4, Lrn1;->b:Ljava/util/Set;

    .line 139
    .line 140
    iget-object v4, v4, Lrn1;->c:Lif2;

    .line 141
    .line 142
    new-instance v9, Ltn1;

    .line 143
    .line 144
    invoke-direct {v9, v6, v7, v8, v4}, Ltn1;-><init>(Ljava/lang/String;Ljava/util/logging/Level;Ljava/util/Set;Lif2;)V

    .line 145
    .line 146
    .line 147
    iput-object v9, v3, Lpn1;->k:Let;

    .line 148
    .line 149
    goto :goto_4

    .line 150
    :cond_6
    invoke-static {}, Lpn1;->m()V

    .line 151
    .line 152
    .line 153
    :cond_7
    :goto_5
    const/4 v1, 0x3

    .line 154
    invoke-direct {v0, v1, v5}, Lbv1;-><init>(ILjava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    sput-object v0, Lr52;->a:Lbv1;

    .line 158
    .line 159
    return-void
.end method
