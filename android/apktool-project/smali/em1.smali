.class public abstract Lem1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Ldl1;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ldl1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ldl1;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lem1;->a:Ldl1;

    .line 8
    .line 9
    new-instance v0, Lcom/google/android/gms/common/api/Scope;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    const-string v2, "profile"

    .line 13
    .line 14
    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Lcom/google/android/gms/common/api/Scope;

    .line 18
    .line 19
    const-string v2, "email"

    .line 20
    .line 21
    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/common/api/Scope;-><init>(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
