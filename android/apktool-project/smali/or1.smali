.class public final Lor1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lg92;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    sget-object v0, Lkr1;->c:Lmd1;

    .line 2
    .line 3
    iget-object v0, v0, Lmd1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v0, Lcb0;

    .line 6
    .line 7
    new-instance v1, Lg92;

    .line 8
    .line 9
    const-string v2, "measurement.service.storage_consent_support_version"

    .line 10
    .line 11
    const-wide/32 v3, 0x31b50

    .line 12
    .line 13
    .line 14
    invoke-direct {v1, v2, v0, v3, v4}, Lg92;-><init>(Ljava/lang/String;Lcb0;J)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lor1;->a:Lg92;

    .line 18
    .line 19
    return-void
.end method
