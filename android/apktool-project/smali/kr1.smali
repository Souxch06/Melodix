.class public abstract Lkr1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lj92;

.field public static volatile b:Ljava/lang/String;

.field public static final c:Lmd1;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    sget-object v0, Ljr1;->b:Ljr1;

    .line 2
    .line 3
    sget v1, Lbe0;->l:I

    .line 4
    .line 5
    sget-object v1, Lsz0;->s:Lsz0;

    .line 6
    .line 7
    new-instance v2, Lcb0;

    .line 8
    .line 9
    new-instance v3, Lu92;

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    invoke-direct {v3, v0, v4, v1}, Lu92;-><init>(Ln90;ZLbe0;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v3, v2, Lcb0;->b:Ljava/lang/Object;

    .line 19
    .line 20
    new-instance v0, Lmd1;

    .line 21
    .line 22
    const/16 v1, 0x10

    .line 23
    .line 24
    invoke-direct {v0, v1, v2}, Lmd1;-><init>(ILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lkr1;->c:Lmd1;

    .line 28
    .line 29
    new-instance v0, Lj92;

    .line 30
    .line 31
    const-string v1, "__phenotype_server_token"

    .line 32
    .line 33
    const-string v3, ""

    .line 34
    .line 35
    invoke-direct {v0, v1, v2, v3}, Lj92;-><init>(Ljava/lang/String;Lcb0;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sput-object v0, Lkr1;->a:Lj92;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    sput-object v0, Lkr1;->b:Ljava/lang/String;

    .line 42
    .line 43
    return-void
.end method

.method public static a()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lkr1;->a:Lj92;

    .line 2
    .line 3
    invoke-virtual {v0}, Lm92;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    return-object v0
.end method
