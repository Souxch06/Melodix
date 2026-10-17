.class public final Luc2;
.super Lwc2;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lsc2;


# instance fields
.field public final j:Ljava/io/FileOutputStream;

.field public final k:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/FileOutputStream;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Luc2;->j:Ljava/io/FileOutputStream;

    .line 5
    .line 6
    iput-object p2, p0, Luc2;->k:Ljava/io/File;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Luc2;->k:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method
