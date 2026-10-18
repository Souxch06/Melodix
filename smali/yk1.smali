.class public final enum Lyk1;
.super Ljava/lang/Enum;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final enum j:Lyk1;

.field public static final enum k:Lyk1;

.field public static final enum l:Lyk1;

.field public static final enum m:Lyk1;

.field public static final enum n:Lyk1;

.field public static final enum o:Lyk1;

.field public static final enum p:Lyk1;

.field public static final enum q:Lyk1;

.field public static final enum r:Lyk1;

.field public static final synthetic s:[Lyk1;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 1
    new-instance v0, Lyk1;

    .line 2
    .line 3
    const-string v1, "INT"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lyk1;->j:Lyk1;

    .line 10
    .line 11
    new-instance v1, Lyk1;

    .line 12
    .line 13
    const-string v2, "LONG"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lyk1;->k:Lyk1;

    .line 20
    .line 21
    new-instance v2, Lyk1;

    .line 22
    .line 23
    const-string v3, "FLOAT"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lyk1;->l:Lyk1;

    .line 30
    .line 31
    new-instance v3, Lyk1;

    .line 32
    .line 33
    const-string v4, "DOUBLE"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lyk1;->m:Lyk1;

    .line 40
    .line 41
    new-instance v4, Lyk1;

    .line 42
    .line 43
    const-string v5, "BOOLEAN"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lyk1;->n:Lyk1;

    .line 50
    .line 51
    new-instance v5, Lyk1;

    .line 52
    .line 53
    const-string v6, "STRING"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lyk1;->o:Lyk1;

    .line 60
    .line 61
    new-instance v6, Lyk1;

    .line 62
    .line 63
    sget-object v7, Lsh;->l:Lsh;

    .line 64
    .line 65
    const-string v7, "BYTE_STRING"

    .line 66
    .line 67
    const/4 v8, 0x6

    .line 68
    invoke-direct {v6, v7, v8}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 69
    .line 70
    .line 71
    sput-object v6, Lyk1;->p:Lyk1;

    .line 72
    .line 73
    new-instance v7, Lyk1;

    .line 74
    .line 75
    const-string v8, "ENUM"

    .line 76
    .line 77
    const/4 v9, 0x7

    .line 78
    invoke-direct {v7, v8, v9}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 79
    .line 80
    .line 81
    sput-object v7, Lyk1;->q:Lyk1;

    .line 82
    .line 83
    new-instance v8, Lyk1;

    .line 84
    .line 85
    const-string v9, "MESSAGE"

    .line 86
    .line 87
    const/16 v10, 0x8

    .line 88
    .line 89
    invoke-direct {v8, v9, v10}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 90
    .line 91
    .line 92
    sput-object v8, Lyk1;->r:Lyk1;

    .line 93
    .line 94
    filled-new-array/range {v0 .. v8}, [Lyk1;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    sput-object v0, Lyk1;->s:[Lyk1;

    .line 99
    .line 100
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lyk1;
    .locals 1

    .line 1
    const-class v0, Lyk1;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lyk1;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lyk1;
    .locals 1

    .line 1
    sget-object v0, Lyk1;->s:[Lyk1;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lyk1;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lyk1;

    .line 8
    .line 9
    return-object v0
.end method
