.class public abstract Le32;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Ls7;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ltb0;

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ltb0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ldl1;

    .line 9
    .line 10
    const/4 v2, 0x3

    .line 11
    invoke-direct {v1, v2}, Ldl1;-><init>(I)V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ls7;

    .line 15
    .line 16
    const-string v3, "Phenotype.API"

    .line 17
    .line 18
    const/4 v4, 0x3

    .line 19
    invoke-direct {v2, v3, v1, v0, v4}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 20
    .line 21
    .line 22
    sput-object v2, Le32;->a:Ls7;

    .line 23
    .line 24
    return-void
.end method
